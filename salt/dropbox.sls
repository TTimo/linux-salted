# originally attempted to use https://github.com/gspe/dropbox-formula, too many issues

# I am not sure what the purpose of that package is. Maybe it's the GUI which I've never used.
dropbox-package:
  cmd.run:
    - name: /bin/bash -c "dpkg -i /tmp/dropbox_2015.10.28_amd64.deb && apt-get -y -f install"
    - unless: dpkg -s dropbox
    - require:
      - file: /tmp/dropbox_2015.10.28_amd64.deb

/tmp/dropbox_2015.10.28_amd64.deb:
  file.managed:
    - source: salt://dropbox/dropbox_2015.10.28_amd64.deb
    - unless: dpkg -s dropbox

# This installs the actual dropbox binaries and functionality
# NOTE: It doesn't update, have to wipe ~/.dropbox-dist and re-run this?
dropbox-daemon:
  cmd.run:
    - name: /bin/bash -c "cd ~ && wget -O - \"https://www.dropbox.com/download?plat=lnx.x86_64\" | tar xzf -"
    - unless: ls ~/.dropbox-dist

# Control script
/usr/local/bin/dropbox.py:
  file.managed:
    - source: salt://dropbox/dropbox.py
    - mode: 755
