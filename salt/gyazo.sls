# see https://github.com/gyazo/Gyazo-for-Linux

/tmp/gyazo.sh:
  file.managed:
    - source: salt://gyazo/gyazo.sh
    - mode: 755
    
gyazo-package:
  cmd.run:
    - name: "/tmp/gyazo.sh"
    - unless: dpkg -s gyazo

gyazo-installed:
  pkg.installed:
    - name: gyazo

