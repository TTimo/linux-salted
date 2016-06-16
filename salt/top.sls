base:
  '*':
    - general
    - emacs
    - mosh
    - fish
    - mono
{% if pillar['flavor'] != 'server' %}
    - general-desktop
    # git clone git@github.com:TTimo/google-chrome-formula.git to /srv/formula
    - google-chrome
    - xdg-open
    - graphics-drivers
    - dropbox
    - lightdm
    - xmonad
    - grub
    - steam
    - gyazo
    - ptrace
    - synergy
    - google-cloud-sdk
{% endif %}
{% if pillar['flavor'] == 'server' %}
    - pyopenssl
{% endif %}
{% if salt.file.directory_exists('/srv/formulas/linux-salted-private') %}
    - private/irssi
    - private/vpn
{% endif %}
{% if salt.file.directory_exists('/srv/formulas/steamrt-formula/steamrt') %}
    # git clone git@github.com:TTimo/steamrt-formula.git
    - steamrt
{% endif %}
{% if pillar['cloud-enabled'] %}
    - cloud
{% endif %}
{% if salt.file.directory_exists('/srv/formulas/docker-formula/docker') %}
    # git clone https://github.com/saltstack-formulas/docker-formula.git
    # NOTE: this requires an edit to have /srv/formulas/docker-formula in file_roots
    - docker
{% endif %}
