# MySQL / MariaDB version of the tree schema

-- Copyright 2020 Google LLC. All Rights Reserved.
--
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

-- Database schema from
-- https://github.com/google/trillian/blob/master/storage/mysql/schema/storage.sql,
-- as of commit e1ac8ba on Feb 18, 2021. Note original file lacked
-- copyright headers, added above based on top-level trillian LICENCE
-- and git history.

-- ---------------------------------------------
-- Tree stuff here
-- ---------------------------------------------

-- Tree parameters should not be changed after creation. Doing so can
-- render the data in the tree unusable or inconsistent.
CREATE TABLE IF NOT EXISTS Trees(
  TreeId                BIGINT NOT NULL,
  TreeState             ENUM('ACTIVE', 'FROZEN', 'DRAINING') NOT NULL,
  TreeType              ENUM('LOG', 'MAP', 'PREORDERED_LOG') NOT NULL,
  HashStrategy          ENUM('RFC6962_SHA256', 'TEST_MAP_HASHER', 'OBJECT_RFC6962_SHA256', 'CONIKS_SHA512_256', 'CONIKS_SHA256') NOT NULL,
  HashAlgorithm         ENUM('SHA256') NOT NULL,
  SignatureAlgorithm    ENUM('ECDSA', 'RSA', 'ED25519') NOT NULL,
  DisplayName           VARCHAR(20),
  Description           VARCHAR(200),
  CreateTimeMillis      BIGINT NOT NULL,
  UpdateTimeMillis      BIGINT NOT NULL,
  MaxRootDurationMillis BIGINT NOT NULL,
  PrivateKey            MEDIUMBLOB NOT NULL,
  PublicKey             MEDIUMBLOB NOT NULL,
  Deleted               BOOLEAN,
  DeleteTimeMillis      BIGINT,
  PRIMARY KEY(TreeId)
);

-- This table contains tree parameters that can be changed at runtime such as for
-- administrative purposes.
CREATE TABLE IF NOT EXISTS TreeControl(
  TreeId                  BIGINT NOT NULL,
  SigningEnabled          BOOLEAN NOT NULL,
  SequencingEnabled       BOOLEAN NOT NULL,
  SequenceIntervalSeconds INTEGER NOT NULL,
  PRIMARY KEY(TreeId),
  FOREIGN KEY(TreeId) REFERENCES Trees(TreeId) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Subtree(
  TreeId               BIGINT NOT NULL,
  SubtreeId            VARBINARY(255) NOT NULL,
  Nodes                MEDIUMBLOB NOT NULL,
  SubtreeRevision      INTEGER NOT NULL,
  -- Key columns must be in ASC order in order to benefit from group-by/min-max
  -- optimization in MySQL.
  PRIMARY KEY(TreeId, SubtreeId, SubtreeRevision),
  FOREIGN KEY(TreeId) REFERENCES Trees(TreeId) ON DELETE CASCADE
);

-- The TreeRevisionIdx is used to enforce that there is only one STH at any
-- tree revision
CREATE TABLE IF NOT EXISTS TreeHead(
  TreeId               BIGINT NOT NULL,
  TreeHeadTimestamp    BIGINT,
  TreeSize             BIGINT,
  RootHash             VARBINARY(255) NOT NULL,
  RootSignature        VARBINARY(1024) NOT NULL,
  TreeRevision         BIGINT,
  PRIMARY KEY(TreeId, TreeHeadTimestamp),
  FOREIGN KEY(TreeId) REFERENCES Trees(TreeId) ON DELETE CASCADE
);

CREATE UNIQUE INDEX TreeHeadRevisionIdx
  ON TreeHead(TreeId, TreeRevision);

-- ---------------------------------------------
-- Log specific stuff here
-- ---------------------------------------------

-- Creating index at same time as table allows some storage engines to better
-- optimize physical storage layout. Most engines allow multiple nulls in a
-- unique index but some may not.

-- A leaf that has not been sequenced has a row in this table. If duplicate leaves
-- are allowed they will all reference this row.
CREATE TABLE IF NOT EXISTS LeafData(
  TreeId               BIGINT NOT NULL,
  -- This is a personality specific has of some subset of the leaf data.
  -- It's only purpose is to allow Trillian to identify duplicate entries in
  -- the context of the personality.
  LeafIdentityHash     VARBINARY(255) NOT NULL,
  -- This is the data stored in the leaf for example in CT it contains a DER encoded
  -- X.509 certificate but is application dependent
  LeafValue            LONGBLOB NOT NULL,
  -- This is extra data that the application can associate with the leaf should it wish to.
  -- This data is not included in signing and hashing.
  ExtraData            LONGBLOB,
  -- The timestamp from when this leaf data was first queued for inclusion.
  QueueTimestampNanos  BIGINT NOT NULL,
  PRIMARY KEY(TreeId, LeafIdentityHash),
  FOREIGN KEY(TreeId) REFERENCES Trees(TreeId) ON DELETE CASCADE
);

-- When a leaf is sequenced a row is added to this table. If logs allow duplicates then
-- multiple rows will exist with different sequence numbers. The signed timestamp
-- will be communicated via the unsequenced table as this might need to be unique, depending
-- on the log parameters and we can't insert into this table until we have the sequence number
-- which is not available at the time we queue the entry. We need both hashes because the
-- LeafData table is keyed by the raw data hash.
CREATE TABLE IF NOT EXISTS SequencedLeafData(
  TreeId               BIGINT NOT NULL,
  SequenceNumber       BIGINT UNSIGNED NOT NULL,
  -- This is a personality specific has of some subset of the leaf data.
  -- It's only purpose is to allow Trillian to identify duplicate entries in
  -- the context of the personality.
  LeafIdentityHash     VARBINARY(255) NOT NULL,
  -- This is a MerkleLeafHash as defined by the treehasher that the log uses. For example for
  -- CT this hash will include the leaf prefix byte as well as the leaf data.
  MerkleLeafHash       VARBINARY(255) NOT NULL,
  IntegrateTimestampNanos BIGINT NOT NULL,
  PRIMARY KEY(TreeId, SequenceNumber),
  FOREIGN KEY(TreeId) REFERENCES Trees(TreeId) ON DELETE CASCADE,
  FOREIGN KEY(TreeId, LeafIdentityHash) REFERENCES LeafData(TreeId, LeafIdentityHash) ON DELETE CASCADE
);

CREATE INDEX SequencedLeafMerkleIdx
  ON SequencedLeafData(TreeId, MerkleLeafHash);

CREATE TABLE IF NOT EXISTS Unsequenced(
  TreeId               BIGINT NOT NULL,
  -- The bucket field is to allow the use of time based ring bucketed schemes if desired. If
  -- unused this should be set to zero for all entries.
  Bucket               INTEGER NOT NULL,
  -- This is a personality specific hash of some subset of the leaf data.
  -- It's only purpose is to allow Trillian to identify duplicate entries in
  -- the context of the personality.
  LeafIdentityHash     VARBINARY(255) NOT NULL,
  -- This is a MerkleLeafHash as defined by the treehasher that the log uses. For example for
  -- CT this hash will include the leaf prefix byte as well as the leaf data.
  MerkleLeafHash       VARBINARY(255) NOT NULL,
  QueueTimestampNanos  BIGINT NOT NULL,
  -- This is a SHA256 hash of the TreeID, LeafIdentityHash and QueueTimestampNanos. It is used
  -- for batched deletes from the table when trillian_log_server and trillian_log_signer are
  -- built with the batched_queue tag.
  QueueID VARBINARY(32) DEFAULT NULL UNIQUE,
  PRIMARY KEY (TreeId, Bucket, QueueTimestampNanos, LeafIdentityHash)
);


