# https://github.com/discourse/discourse/blob/master/docs/INSTALL-cloud.md
# Rest of the config and install is manual but it's not terrible

{% if not salt.file.file_exists('/var/discourse') %}

https://github.com/discourse/discourse_docker.git:
  git.latest:
    - target: /var/discourse

{% endif %}
