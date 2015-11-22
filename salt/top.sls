base:
  '*':
    - general
    - emacs
    - mosh
    - fish
{% if pillar['flavor'] != 'server' %}
    # git clone https://github.com/ahdinosaur-os/google-chrome-formula to /srv/formula
    - google-chrome
    - graphics-drivers
    - dropbox
    - lightdm
    - xmonad
{% endif %}
{% if salt.file.directory_exists('/srv/formulas/linux-salted-private/irssi') %}
    - irssi
{% endif %}
