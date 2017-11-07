lyx:
  pkgrepo.managed:
# ppa will use the local system distro - there is no artful ppa atm    
#    - ppa: lyx-devel/release
    - name: deb http://ppa.launchpad.net/lyx-devel/release/ubuntu zesty main
  pkg.latest:
    - name: lyx
    - refresh: True

