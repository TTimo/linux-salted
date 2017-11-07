# see https://www.dropbox.com/help/desktop-web/linux-repository
# xenial is latest available at time of writing (no zesty)
dropbox:
  pkgrepo.managed:
    - humanname: dropbox
    - name: deb http://linux.dropbox.com/ubuntu xenial main
    - dist: xenial
  pkg.latest:
    - name: dropbox
    - refresh: True
