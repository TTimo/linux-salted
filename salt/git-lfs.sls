git-lfs:
  pkgrepo.managed:
    - name: deb https://packagecloud.io/github/git-lfs/ubuntu/ zesty main
    - dist: zesty
  pkg.latest:
    - name: git-lfs
    - refresh: True
