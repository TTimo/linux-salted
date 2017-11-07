/tmp/steam_latest.deb:
  file.managed:
    - source: salt://steam/steam_latest.deb
    - unless: dpkg -s steam

steam:
  cmd.run:
    - name: "gdebi -n /tmp/steam_latest.deb"
    - unless: dpkg -s steam
    - require:
      - file: /tmp/steam_latest.deb
