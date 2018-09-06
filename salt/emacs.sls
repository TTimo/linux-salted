{% if pillar['flavor'] == 'server' %}
emacs-nox:
  pkg.installed
{% else %}
emacs-pkg-removed:
  pkg.removed:
    - pkgs:
      - emacs-nox
      - emacs24-nox

emacs:
  pkg.installed
{% endif %}

yaml-mode:
  pkg.installed
