xmonad-packages:
  pkg.installed:
    - pkgs:
      - xmonad
      - xmobar
      - rxvt-unicode

{% set user = salt['pillar.get']('default-user') %}

{{ salt['user.info'](user).get('home') }}/.xmonad/xmobarrc:
  file.managed:
    - source:
      - salt://xmonad/xmobarrc
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - makedirs: True

{{ salt['user.info'](salt['pillar.get']('default-user')).get('home') }}/.xmonad/xmonad.hs:
  file.managed:
    - source:
      - salt://xmonad/xmonad.hs
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - makedirs: True

{{ salt['user.info'](salt['pillar.get']('default-user')).get('home') }}/.Xdefaults:
  file.managed:
    - source:
      - salt://xmonad/.Xdefaults
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - makedirs: True
      