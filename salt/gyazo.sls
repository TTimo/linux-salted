# see https://github.com/gyazo/Gyazo-for-Linux
gyazo:
  pkgrepo.managed:
    - name: deb https://packagecloud.io/gyazo/gyazo-for-linux/ubuntu/ zesty main
    - dist: zesty
  pkg.latest:
    - name: gyazo
    - refresh: True
