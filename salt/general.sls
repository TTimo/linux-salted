general-pkg-installed:
  pkg.installed:
    - pkgs:
      - aptitude
      - apt-file
      - python-apt
      - python-pip
      - python3-pip
      - net-tools
      - tmux
      - htop
      - iotop
      - iptraf
      - perf-tools-unstable
      - git
      - subversion
      - vim
      - unzip
      - sysstat
      - irssi
      - virt-what
      - flip
      - python-gtk2
      - cpuid
      - flex
      - bison
      - btrfs-tools
      - gdebi
      - deborphan
      - autossh
      - pylint
      - pylint3
      - schroot
      - awscli
      - python3-boto3
      - ipython3
      - inotify-tools

general-pip-installed:
  pip.installed:
    - names:
      - treq
