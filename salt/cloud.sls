# https://docs.saltstack.com/en/latest/topics/cloud/windows.html
# in order to support spinning up windows minions, some extra software is needed

python-pip:
  pkg.installed

pywinrm:
  pip.installed:
    - require:
      - pkg: python-pip

# I don't trust the distro package - no particular reason though
impacket:
  pip.installed:
    - require:
      - pkg: python-pip

{% set user = salt['pillar.get']('default-user') %}
{% set home = salt['user.info'](user).get('home') %}

winexe-package:
  cmd.run:
    - name: sh -c "dpkg -i /tmp/winexe_1.00.1-1_amd64.deb && apt-get -y -f install"
    - unless: dpkg -s winexe
    - require:
      - file: /tmp/winexe_1.00.1-1_amd64.deb

/tmp/winexe_1.00.1-1_amd64.deb:
  file.managed:
    - source: salt://cloud/winexe_1.00.1-1_amd64.deb

