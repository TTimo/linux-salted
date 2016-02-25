base:
  '*':
    - general
    - google-chrome
{% if salt.file.file_exists('/srv/pillar/flavor.sls') %}
    - flavor
{% else %}
    - flavor-default
{% endif %}
  'master':
{% if salt.file.file_exists('/srv/pillar/ec2.sls') %}
    - ec2
{% endif %}
# FIXME: why do I have to copy this, it should be available through '*' already
# https://docs.saltstack.com/en/latest/topics/pillar/
# 'In this expanded top file, minions that match web* will have access to the /srv/pillar/pacakges.sls file, as well as the /srv/pillar/vim.sls file.'
{% if salt.file.file_exists('/srv/pillar/flavor.sls') %}
    - flavor
{% else %}
    - flavor-default
{% endif %}
