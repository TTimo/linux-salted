# TODO: this is not working, the .sls is disabled atm
{% if salt['cmdmod.retcode']('lspci | grep NVIDIA') == 0 %}

graphics-drivers:
  pkgrepo.managed:
    - ppa: graphics-drivers/ppa
  pkg.installed:
    - pkgs:
      - nvidia-378
      - nvidia-378-dev
      - nvidia-modprobe
      - mesa-utils
      - phoronix-test-suite

graphics-drivers-removed:
  pkg.removed:
    - pkgs:
      - xserver-xorg-video-nouveau

{% endif %}
