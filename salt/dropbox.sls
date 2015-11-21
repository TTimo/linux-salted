# originally attempted to use https://github.com/gspe/dropbox-formula, too many issues

dropbox-package:
  cmd.run:
    - name: "dpkg -i /tmp/dropbox_2015.10.28_amd64.deb && apt-get -y -f install"
    - unless: dpkg -s dropbox
    - require:
      - file: /tmp/dropbox_2015.10.28_amd64.deb

/tmp/dropbox_2015.10.28_amd64.deb:
  file.managed:
    - source: salt://dropbox/dropbox_2015.10.28_amd64.deb

dropbox-daemon:
  cmd.run:
    - name: "cd ~ && wget -O - \"https://www.dropbox.com/download?plat=lnx.x86_64\" | tar xzf -"
    - unless: ls ~/.dropbox-dist

/usr/local/bin/dropbox.py:
  file.managed:
    - source: salt://dropbox/dropbox.py
    - mode: 755
