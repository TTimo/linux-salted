/etc/lightdm/lightdm.conf.d/50-ubuntu.conf:
  file.managed:
    - source:
      - salt://lightdm/50-ubuntu.conf
    - makedirs: True
