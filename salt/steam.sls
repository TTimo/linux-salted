/tmp/steam_latest.deb:
  file.managed:
    - source: salt://steam/steam_latest.deb
    - unless: dpkg -s steam

steam-package:
  cmd.run:
    - name: "dpkg -i /tmp/steam_latest.deb"
    - unless: dpkg -s steam
    - require:
      - file: /tmp/steam_latest.deb

# FIXME: 'Steam License Agreement was declined'
#steam-installed:
#  pkg.installed:
#    - pkgs:
#      - steam:i386

# https://askubuntu.com/questions/614422/problem-with-installing-steam-on-ubuntu-15-04/614458#614458
#steam-fixup:
#  cmd.run:
#    - name: "find $HOME/.steam/root/ubuntu12_32/steam-runtime/*/usr/lib/ -name \"libstdc++.so.6\" -exec mv \"{}\" \"{}.bak\" \\; -print"
#    - onlyif: "find $HOME/.steam/root/ubuntu12_32/steam-runtime/*/usr/lib/ -name \"libstdc++.so.6\" | grep libstd"
