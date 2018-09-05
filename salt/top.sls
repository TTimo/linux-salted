base:
  'os_family:Debian':
    - match: grain
    - general
    - emacs
    - fish
    - mono
    - ipv6

{% if pillar['flavor'] == 'desktop' %}
    # common to my Ubuntu and SteamOS installs
    - general-desktop
    - dropbox
    - lightdm
    - xmonad
    - p4
    - google-chrome
    - sourcetrail
{% endif %}

{% if pillar['flavor'] == 'server' %}
    - swappiness
{% endif %}

  'not G@os:SteamOS':
    - match: compound
    - ubuntu-mosh
    - git-lfs
{% if pillar['flavor'] == 'desktop' %}
    # too specific and intrusive to do on SteamOS images
    - ubuntu-desktop
    - gyazo
    - ptrace
    - xdg-open
    - graphics-drivers
    - grub
    - steam
    - google-cloud-sdk
    - ssh
    - flatpak
    - chrome-remote-desktop
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

  'os_family:Windows':
    - match: grain
    - cloud/windows-minion-general
{% if pillar['buildbot'] %}
    - buildbot-win
{% endif %}
