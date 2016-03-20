graphics-drivers:
  pkgrepo.managed:
    - ppa: graphics-drivers/ppa
  pkg.installed:
    - pkgs:
      - nvidia-361
      - nvidia-361-dev
      - nvidia-modprobe
      - mesa-utils
      - phoronix-test-suite

graphics-drivers-removed:
  pkg.removed:
    - pkgs:
      - xserver-xorg-video-nouveau
