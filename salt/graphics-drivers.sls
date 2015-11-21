graphics-drivers:
  pkgrepo.managed:
    - ppa: graphics-drivers/ppa
  pkg.installed:
    - pkgs:
      - nvidia-358
      - nvidia-358-dev
      - nvidia-modprobe
      - bumblebee-nvidia
      - mesa-utils
      - phoronix-test-suite
