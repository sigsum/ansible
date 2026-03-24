# yubihsm-connector, arm64
```
linus@sign-01:~$ curl -sO https://ftp.acc.umu.se/debian/dists/forky/InRelease
linus@sign-01:~$ curl -sO https://ftp.acc.umu.se/debian/dists/forky/main/binary-arm64/Packages.xz
linus@sign-01:~$ curl -sO https://ftp.acc.umu.se/debian/pool/main/y/yubihsm-connector/yubihsm-connector_3.0.7-1_arm64.deb

linus@sign-01:~$ gpg --keyring /usr/share/keyrings/debian-archive-keyring.pgp --verify InRelease
gpg: Signature made Mon 23 Mar 2026 03:13:41 AM CET
gpg:                using RSA key 4CB50190207B4758A3F73A796ED0E7B82643E131
gpg: /home/linus/.gnupg/trustdb.gpg: trustdb created
gpg: Good signature from "Debian Archive Automatic Signing Key (12/bookworm) <ftpmaster@debian.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: B8B8 0B5B 623E AB6A D877  5C45 B7C5 D7D6 3509 47F8
     Subkey fingerprint: 4CB5 0190 207B 4758 A3F7  3A79 6ED0 E7B8 2643 E131
gpg: Signature made Mon 23 Mar 2026 03:13:48 AM CET
gpg:                using RSA key B8E5F13176D2A7A75220028078DBA3BC47EF2265
gpg: Good signature from "Debian Archive Automatic Signing Key (13/trixie) <ftpmaster@debian.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 04B5 4C3C DCA7 9751 B16B  C6B5 2256 29DF 75B1 88BD
     Subkey fingerprint: B8E5 F131 76D2 A7A7 5220  0280 78DB A3BC 47EF 2265

linus@sign-01:~$ rg main/binary-arm64/Packages.xz InRelease
220: 092a85385e99f9a9f0cdedd0624894da  9622212 main/binary-arm64/Packages.xz
928: 2037c080598034589e502f1f3fb1870b3eb1b2d4dd48971fbbe216bdd34b6a3a  9622212 main/binary-arm64/Packages.xz

linus@sign-01:~$ sha256sum Packages.xz
2037c080598034589e502f1f3fb1870b3eb1b2d4dd48971fbbe216bdd34b6a3a  Packages.xz
linus@sign-01:~$ xz -cd Packages.xz | awk '/^Package: yubihsm-connector/{doprint=1}/^SHA256:/{if (doprint) {print;exit}}'
SHA256: ade548f674e4b9b795ed43b02c037e9aa8dd863b79e25b70c18870e8c396eee6

linus@sign-01:~$ sha256sum yubihsm-connector_3.0.7-1_arm64.deb
ade548f674e4b9b795ed43b02c037e9aa8dd863b79e25b70c18870e8c396eee6  yubihsm-connector_3.0.7-1_arm64.deb
```

# yubihsm-connector, amd64
```
linus@sign-01:~$ curl -sO https://ftp.acc.umu.se/debian/dists/forky/InRelease
linus@sign-01:~$ curl -sO https://ftp.acc.umu.se/debian/dists/forky/main/binary-amd64/Packages.xz
linus@sign-01:~$ curl -sO https://ftp.acc.umu.se/debian/pool/main/y/yubihsm-connector/yubihsm-connector_3.0.7-1_amd64.deb

linus@sign-01:~$ gpg --keyring /usr/share/keyrings/debian-archive-keyring.pgp --verify InRelease
gpg: Signature made Mon 23 Mar 2026 09:08:21 AM CET
gpg:                using RSA key 4CB50190207B4758A3F73A796ED0E7B82643E131
gpg: Good signature from "Debian Archive Automatic Signing Key (12/bookworm) <ftpmaster@debian.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: B8B8 0B5B 623E AB6A D877  5C45 B7C5 D7D6 3509 47F8
     Subkey fingerprint: 4CB5 0190 207B 4758 A3F7  3A79 6ED0 E7B8 2643 E131
gpg: Signature made Mon 23 Mar 2026 09:08:28 AM CET
gpg:                using RSA key B8E5F13176D2A7A75220028078DBA3BC47EF2265
gpg: Good signature from "Debian Archive Automatic Signing Key (13/trixie) <ftpmaster@debian.org>" [unknown]
gpg: WARNING: This key is not certified with a trusted signature!
gpg:          There is no indication that the signature belongs to the owner.
Primary key fingerprint: 04B5 4C3C DCA7 9751 B16B  C6B5 2256 29DF 75B1 88BD
     Subkey fingerprint: B8E5 F131 76D2 A7A7 5220  0280 78DB A3BC 47EF 2265

linus@sign-01:~$ rg main/binary-amd64/Packages.xz InRelease
215: 9f6a0c75ef9ffeee3ab86e82b408cf0d  9676696 main/binary-amd64/Packages.xz
923: 0662e705443e52cdc44bf94ec2b131a213254d5fd8110be87714853bc6bf1518  9676696 main/binary-amd64/Packages.xz
linus@sign-01:~$ sha256sum Packages.xz
0662e705443e52cdc44bf94ec2b131a213254d5fd8110be87714853bc6bf1518  Packages.xz

linus@sign-01:~$ xz -cd Packages.xz | awk '/^Package: yubihsm-connector/{doprint=1}/^SHA256:/{if (doprint) {print;exit}}'
SHA256: 8d99dcc676490d7d7e87c73a7f1fa8c7f9620c303c476b940de24875fe4f9db4
linus@sign-01:~$ sha256sum yubihsm-connector_3.0.7-1_amd64.deb
8d99dcc676490d7d7e87c73a7f1fa8c7f9620c303c476b940de24875fe4f9db4  yubihsm-connector_3.0.7-1_amd64.deb
```
