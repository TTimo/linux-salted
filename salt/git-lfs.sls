git-lfs:
# See https://github.com/git-lfs/git-lfs/wiki/Installation, this fails to install the key
#  pkgrepo.managed:
#    - name: deb https://packagecloud.io/github/git-lfs/ubuntu/ xenial main
  pkg.latest:
    - name: git-lfs
    - refresh: True
