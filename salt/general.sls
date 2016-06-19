general-pkg-installed:
  pkg.installed:
    - pkgs:
      - aptitude
      - apt-file
      - python-software-properties
      - tmux
      - htop
      - iotop
      - iptraf
      - git
      - subversion
      - vim
      - unzip
      - sysstat
      - irssi
      - virt-what
      - flip
      - python-gtk2

# Don't use pip from package manager, it's critically outdated on too many distros
# http://stackoverflow.com/questions/27711184/why-is-pip-raising-an-assertionerror-on-pip-freeze
# I also ran into this while switching: https://github.com/saltstack/salt/issues/33163
general-pkg-removed:
  pkg.removed:
    - pkgs:
      - python-pip
