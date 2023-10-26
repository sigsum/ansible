# How to make a release

- Check that the default versions of trillian, sigsum-go and log-go to
  be installed are updated in both of the following files
  (cf. https://git.glasklar.is/sigsum/admin/ansible/-/issues/17):

  - roles/sigsum/defaults/main.yml
  - roles/sigsum/meta/argument_specs.yml

- Update docs/docsite/rst/CHANGELOG.rst

- Update galaxy.yml 'version'

- git tag --sign v${VERSION} -m "Release ${VERSION}"
