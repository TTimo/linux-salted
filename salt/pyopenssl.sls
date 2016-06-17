# salt complained about python-openssl being too old, install via pip

apt-pyopenssl-removed:
  pkg.removed:
    - pkgs:
      - python-openssl

apt-pyopenssl-support:
  pkg.installed:
    - pkgs:
      - libffi-dev
      - libssl-dev

pyopenssl:
  pip.installed

