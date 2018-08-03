# see https://www.dropbox.com/help/desktop-web/linux-repository
# xenial is latest available - 2018/5/6

# even after hacking out the GPG validation, this is still broken
# their apt server is misconfigured? 'Hash Sum mismatch'
# fetching Contents-i386.gz but expecting size and hash of Contents-i386

#dropbox:
#  pkgrepo.managed:
#    - humanname: dropbox
#    - name: deb [trusted=yes] http://linux.dropbox.com/ubuntu xenial main
#    - dist: xenial
#    # pgp.mit.edu is down, added [trusted=yes] above ..
#    #- keyserver: pgp.mit.edu
#    #- keyid: 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
#  pkg.latest:
#    - name: dropbox
#    - refresh: True

# Forget about the apt method, just do this:

/tmp/dropbox.deb:
  file.managed:
    - source: salt://dropbox_2015.10.28_amd64.deb
    - unless: dpkg -s dropbox

dropbox:
  cmd.run:
    - name: "gdebi -n /tmp/dropbox.deb"
    - unless: dpkg -s dropbox
    - require:
      - file: /tmp/dropbox.deb
