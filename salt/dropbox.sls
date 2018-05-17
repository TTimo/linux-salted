# see https://www.dropbox.com/help/desktop-web/linux-repository
# xenial is latest available - 2018/5/6
dropbox:
  pkgrepo.managed:
    - humanname: dropbox
    - name: deb http://linux.dropbox.com/ubuntu xenial main
    - dist: xenial
  pkg.latest:
    - name: dropbox
    - refresh: True
