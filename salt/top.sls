base:
  '*':
    - general
    - emacs
    - mosh
    - fish
{% if pillar['flavor'] != 'server' %}
    - general-desktop
    # git clone https://github.com/ahdinosaur-os/google-chrome-formula to /srv/formula
    - google-chrome
    - graphics-drivers
    - dropbox
    - lightdm
    - xmonad
    - grub
    - steam
    - gyazo
    - ptrace
{% endif %}
{% if salt.file.directory_exists('/srv/formulas/linux-salted-private') %}
    - private/irssi
    - private/vpn
{% endif %}
{% if salt.file.directory_exists('/srv/formulas/steamrt-formula/steamrt') %}
    - steamrt
{% endif %}
