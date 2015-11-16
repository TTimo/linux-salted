# This is from: https://github.com/ahdinosaur-os/google-chrome-formula
# I have not been able to set it up and use it as a formula

{% set version = salt['pillar.get']('google-chrome:version', 'stable') %}

{% if grains['osarch'] == 'amd64' %}
{% set arch = 'x86_64' %}
{% elif grains['osarch'] == 'x86' %}
{% set arch = 'i386' %}
{% else %}
{% set arch = grains['osarch'] %}
{% endif %}

google-chrome:
{% if grains['os_family'] == 'Debian' %}
  pkg.installed:
    - name: google-chrome-{{ version }}
  pkgrepo.managed:
    - file: /etc/apt/sources.list.d/google-chrome.list
    - name: deb http://dl.google.com/linux/chrome/deb/ stable main
    - key_url: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - require_in:
      - pkg: google-chrome
{% elif grains['os_family'] == 'RedHat' %}
  pkgrepo.managed:
    - humanname: google-chrome
    - mirrorlist: http://dl.google.com/linux/chrome/rpm/stable/{{ arch }}
    - gpgcheck: 1
    - gpgkey: https://dl-ssl.google.com/linux/linux_signing_key.pub
    - require_in:
      - pkg: google-chrome
  pkg.installed:
    name: google-chrome-{{ version }}
{% else %}
  pkg.installed:
    name: chromium
{% endif %}
