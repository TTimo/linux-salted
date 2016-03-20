base:
  '*':
    - general
    - emacs
    - mosh
    - fish
{% if pillar['flavor'] != 'server' %}
    - general-desktop
    # git clone git@github.com:TTimo/google-chrome-formula.git to /srv/formula
    - google-chrome
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
