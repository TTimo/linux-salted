base:
  '*':
    - general
    - google-chrome
    - flavor-default
{% if salt.file.file_exists('/srv/pillar/flavor.sls') %}
    # optional config overrides some of the defaults
    - flavor
{% endif %}
{% if salt.file.file_exists('/srv/pillar/ec2.sls') %}
    # optional ec2 credentials for salt-cloud
    - ec2
{% endif %}
