python-pip:
  pkg.installed

general-pkg-installed:
  pkg.installed:
    - pkgs:
      - aptitude
      - apt-file
      - python-apt
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
      - python3-boto3
