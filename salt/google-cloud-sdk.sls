# The package manager version does not support extra components like app engine:
# https://cloud.google.com/sdk/#deb

#google-cloud-sdk:
#  pkg.installed:
#    - name: google-cloud-sdk
#  pkgrepo.managed:
#    - file: /etc/apt/sources.list.d/google-cloud-sdk.list
#    - name: deb http://packages.cloud.google.com/apt cloud-sdk-wily main
#    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg
#    - require_in:
#        - pkg: google-cloud-sdk

{% set user = salt['pillar.get']('default-user') %}
{% set home = salt['user.info'](user).get('home') %}

"/bin/bash -c \"curl https://sdk.cloud.google.com | CLOUDSDK_CORE_DISABLE_PROMPTS=1 bash\"":
  cmd.run:
    - creates: {{ home }}/google-cloud-sdk

"/bin/bash -c \"{{ home }}/google-cloud-sdk/bin/gcloud components install app-engine-python -q\"":
  cmd.run:
    - creates: {{ home }}/google-cloud-sdk/platform/google_appengine

# TODO: add the path to fish (the SDK installer took care of bash)
# additional edits in /usr/share/fish/config.fish ?
# set PATH ~/google-cloud/sdk/bin $PATH
# - add a blockreplace here
# - fixup blockreplace in fish.sls
