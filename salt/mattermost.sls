/tmp/mattermost.deb:
  file.managed:
    - source: salt://mattermost-desktop-4.1.2-linux-amd64.deb
    - unless: dpkg -s mattermost-desktop

mattermost:
  cmd.run:
    - name: "gdebi -n /tmp/mattermost.deb"
    - unless: dpkg -s mattermost-desktop
    - require:
      - file: /tmp/mattermost.deb
