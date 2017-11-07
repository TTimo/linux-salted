# http://fishshell.com/

fish_shell:
  pkgrepo.managed:
    - ppa: fish-shell/release-2
    - dist: artful
  pkg.latest:
    - name: fish
    - refresh: True

# may not be necessary anymore
## https://github.com/fish-shell/fish-shell/issues/107
#/usr/share/fish/config.fish:
#  file.blockreplace:
#    - content: |
#        function fish_title
#          true
#        end
#    - append_if_not_found: True
#    - require:
#      - pkg: fish

# make it the default shell, YOLO
"chsh -s /usr/bin/fish root":
  cmd.run:
    - unless: "grep root /etc/passwd | grep fish" 

{% set user = salt['pillar.get']('default-user') %}

"chsh -s /usr/bin/fish {{ user }}":
  cmd.run:
    - unless: "grep {{ user }} /etc/passwd | grep fish"
