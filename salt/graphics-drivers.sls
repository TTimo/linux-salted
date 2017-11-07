{% if salt['cmd.retcode']('/bin/bash -c "/usr/bin/lspci | grep NVIDIA"') == 0 %}

graphics-drivers:
  pkgrepo.managed:
    - ppa: graphics-drivers/ppa
  pkg.installed:
    - pkgs:
      - nvidia-381
      - nvidia-381-dev
      - nvidia-modprobe
      - mesa-utils
      - phoronix-test-suite

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
