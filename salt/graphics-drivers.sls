{% if salt['cmd.retcode']('/bin/bash -c "/usr/bin/lspci | grep NVIDIA"') == 0 %}

graphics-drivers:
  pkgrepo.managed:
    - ppa: graphics-drivers/ppa
  pkg.latest:
    - refresh: True
    - pkgs:
      - nvidia-387
      - nvidia-387-dev
      - mesa-utils

graphics-drivers-removed:
  pkg.removed:
    - pkgs:
      - xserver-xorg-video-nouveau

{% endif %}

{% if salt['cmd.retcode']('/bin/bash -c "/usr/bin/lspci | grep -i radeon"') == 0 %}

padoka:
  pkgrepo.managed:
    - ppa: paulo-miguel-dias/mesa
  pkg.latest:
    - refresh: True
  
{% endif %}
