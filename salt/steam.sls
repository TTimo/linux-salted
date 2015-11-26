/tmp/steam_latest.deb:
  file.managed:
    - source: salt://steam/steam_latest.deb

steam-package:
  cmd.run:
    - name: "dpkg -i /tmp/steam_latest.deb"
    - unless: dpkg -s steam
    - require:
      - file: /tmp/steam_latest.deb

# 'Steam License Agreement was declined'
#steam-installed:
#  pkg.installed:
#    - pkgs:
#      - steam:i386
