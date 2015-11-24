# http://fishshell.com/

fish_shell:
  pkgrepo.managed:
    - ppa: fish-shell/release-2
  pkg.installed:
    - name: fish

# https://github.com/fish-shell/fish-shell/issues/107
/usr/share/fish/config.fish:
  file.blockreplace:
    - content: |
        function fish_title
          true
        end
    - append_if_not_found: True
    - require:
      - pkg: fish

# TODO: make it the default shell for root and default user with chsh
