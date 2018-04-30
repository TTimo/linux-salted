{% if salt['cmd.retcode']('/bin/bash -c "/usr/bin/lspci | grep NVIDIA"') == 0 %}

graphics-drivers:
  pkgrepo.managed:
    - ppa: graphics-drivers/ppa
  pkg.latest:
    - refresh: True
    - pkgs:
      - nvidia-396
      - nvidia-396-dev
      - mesa-utils
      - mesa-utils:i386

graphics-drivers-removed:
  pkg.removed:
    - pkgs:
      - xserver-xorg-video-nouveau

{% endif %}

{% if salt['cmd.retcode']('/bin/bash -c "/usr/bin/lspci | grep -i radeon"') == 0 %}

padoka:
  pkgrepo.managed:
    - ppa: paulo-miguel-dias/mesa
  
{% endif %}
