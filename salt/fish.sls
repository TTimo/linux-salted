# http://fishshell.com/

fish_shell:
  pkgrepo.managed:
    - ppa: fish-shell/release-2
    - dist: artful
  pkg.latest:
    - name: fish
    - refresh: True

# disabled for desktop, setting this via SHELL env var in ~/.xsession
{% if pillar['flavor'] == 'server' %}

# set as default shell

"chsh -s /usr/bin/fish root":
  cmd.run:
    - unless: "grep root /etc/passwd | grep fish" 

{% set user = salt['pillar.get']('default-user') %}

"chsh -s /usr/bin/fish {{ user }}":
  cmd.run:
    - unless: "grep {{ user }} /etc/passwd | grep fish"

{% endif %}
