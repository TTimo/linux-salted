# https://docs.saltstack.com/en/latest/topics/cloud/windows.html
# in order to support spinning up windows minions, some extra software is needed on the sale master

cloud-support-packages:
  pkg.installed:
    - pkgs:
      - python-winrm
      - python-impacket

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

aws-cloud-credentials-create:
  file.managed:
    - name: {{ home }}/.aws/credentials
    - makedirs: True
    - user: {{ user }}
    - group: {{ user }}
    - mode: 644

aws-cloud-credentials-set:      
  file.blockreplace:
    - append_if_not_found: True
    - marker_start: '# -- start salt cloud creds'
    - marker_end: '# -- end salt cloud creds'
    - name: {{ home }}/.aws/credentials
    - content: |
        [salt cloud]
        aws_access_key_id = {{ salt['pillar.get']('ec2:id') }}
        aws_secret_access_key = {{ salt['pillar.get']('ec2:key') }}
        region = {{ salt['pillar.get']('ec2:location') }}

# Still confused by this, but apparently ~/.aws/credentials is all I should need
{{ home }}/.aws/config:
  file.missing
