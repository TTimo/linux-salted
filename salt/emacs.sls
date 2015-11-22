{% if pillar['flavor'] == 'server' %}
emacs-pkg-installed:
  pkg.installed:
    - pkgs:
      - emacs24-nox
{% else %}
emacs-pkg-removed:
  pkg.removed:
    - pkgs:
      - emacs24-nox
    
emacs-pkg-installed:
  pkg.installed:
    - pkgs:
      - emacs24
      - yaml-mode
{% endif %}

yaml-mode:
  pkg.installed
