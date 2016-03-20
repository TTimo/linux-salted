# xdg-open is still opening things with FireFox after chrome is setup. address this

{% set user = salt['pillar.get']('default-user') %}
{% set home = salt['user.info'](user).get('home') %}

{{ home }}/.local/share/applications/defaults.list:
  file.managed:
    - source:
        - salt://defaults.list
