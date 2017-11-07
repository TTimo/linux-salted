{% if pillar['flavor'] == 'server' %}
emacs-pkg-installed:
  pkg.installed:
    - pkgs:
      - emacs-nox
{% else %}
emacs-pkg-removed:
  pkg.removed:
    - pkgs:
      - emacs-nox
    
emacs-pkg-installed:
  pkg.installed:
    - pkgs:
      - emacs
      - yaml-mode
{% endif %}

yaml-mode:
  pkg.installed
