/etc/lightdm/lightdm.conf.d/50-ubuntu.conf:
  file.managed:
    - source:
      - salt://lightdm/50-ubuntu.conf
    - makedirs: True

/usr/share/xsessions/xsession.desktop:
  file.managed:
    - source:
      - salt://lightdm/xsession.desktop

{% set user = salt['pillar.get']('default-user') %}

{{ salt['user.info'](user).get('home') }}/.xsession:
   file.managed:
     - source:
       - salt://lightdm/_xsession
     - user: {{ user }}
     - group: {{ user }}
     - mode: 755
