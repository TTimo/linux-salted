# https://docs.saltstack.com/en/latest/topics/cloud/windows.html
# in order to support spinning up windows minions, some extra software is needed on the sale master

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

# configure providers and profiles for EC2
# see https://docs.saltstack.com/en/latest/topics/cloud/aws.html

/etc/salt/cloud:
  file.managed:
    - source: salt://cloud/cloud.template
    - user: root
    - group: root
    - mode: 644
    - template: jinja

/etc/salt/cloud.profiles:
  file.managed:
    - source: salt://cloud/cloud.profiles.template
    - user: root
    - group: root
    - mode: 644
    - template: jinja
