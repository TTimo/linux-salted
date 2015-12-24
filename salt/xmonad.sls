xmonad-packages:
  pkg.installed:
    - pkgs:
      - xmonad
      - xmobar
      - rxvt-unicode
      - fonts-inconsolata

{% set user = salt['pillar.get']('default-user') %}
{% set home = salt['user.info'](user).get('home') %}

{{ home }}/.xmonad/xmobarrc:
  file.managed:
    - source:
      - salt://xmonad/xmobarrc
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - makedirs: True

{{ home }}/.xmonad/xmonad.hs:
  file.managed:
    - source:
      - salt://xmonad/xmonad.hs
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - makedirs: True

# for rxvt-unicode
# TODO: fix the color scheme a bit, some of the colors are unreadable
{{ home }}/.Xdefaults:
  file.managed:
    - source:
      - salt://xmonad/_Xdefaults
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644
    - makedirs: True
