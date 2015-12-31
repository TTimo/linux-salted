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
