base:
  'os_family:Debian':
    - match: grain
    - general
    - emacs
    - mosh
    - fish
    - mono
    - ipv6
{% if pillar['flavor'] != 'server' %}
    - general-desktop
    - xdg-open
    - graphics-drivers
    - dropbox
    - lightdm
    - xmonad
    - grub
    - steam
    - gyazo
    - ptrace
# outdated, would need a redo
# synergy is crappy anyway, and I don't actually need it on all my desktop deployments
#    - synergy
    - google-cloud-sdk
    - lyx
    - p4
    - ssh
    - git-lfs
    - google-chrome
	- llvm
{% else %}
    - pyopenssl
    - swappiness
{% endif %}

# private .. e.g. not public :-)
{% if salt.file.directory_exists('/srv/formulas/linux-salted-private') %}
    - private/irssi
#    - private/vpn
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
    - cloud/chocolatey

