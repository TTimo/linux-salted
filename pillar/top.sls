base:
  '*':
    - general
    - google-chrome
{% if salt.file.file_exists('/srv/pillar/flavor.sls') %}
    - flavor
{% else %}
    - flavor-default
{% endif %}
