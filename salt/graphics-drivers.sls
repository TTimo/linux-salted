{% if salt['cmd.retcode']('/bin/bash -c "/usr/bin/lspci | grep NVIDIA"') == 0 %}

graphics-drivers:
  pkgrepo.managed:
    - ppa: graphics-drivers/ppa
  pkg.latest:
    - refresh: True
    - pkgs:
      - nvidia-driver-396
      - mesa-utils
      - mesa-utils:i386

graphics-drivers-removed:
  pkg.removed:
    - pkgs:
      - xserver-xorg-video-nouveau

vulkan-packages:
  pkg.latest:
    - refresh: True
    - pkgs:
      - libvulkan1
      - libvulkan1:i386

{% endif %}

{% if salt['cmd.retcode']('/bin/bash -c "/usr/bin/lspci | grep -i radeon"') == 0 %}

# 2018/07/29 - Xorg is crashing during startup, disabled this and downgraded from all padoka packages to official ubuntu
#padoka:
#  pkgrepo.managed:
#    - ppa: paulo-miguel-dias/mesa

# See https://bugs.freedesktop.org/show_bug.cgi?id=104928
# "libglvnd_1.0.0 disables amdgpu direct rendering"
# symptoms: OpenGL renderer string out of glxinfo says 'llvmpipe'
# (WW) AMDGPU(0): Direct rendering disabled in Xorg log
libegl-mesa0:
  pkg.installed

# Might as well ditch those too, their presence is possibly related to the bug mentioned above
"apt remove -y 'libnvidia-*'":
  cmd.run

vulkan-packages:
  pkg.latest:
    - refresh: True
    - pkgs:
      - mesa-vulkan-drivers
      - mesa-vulkan-drivers:i386

{% endif %}

graphics-drivers-common:
  pkg.latest:
    - refresh: True
    - pkgs:
      - vulkan-utils
      # for a 32 bit glxinfo:
      # I wish it was possible to install both 32 and 64 bit versions of mesa-utils
      # but as long as Steam and so many games are 32 bit, it's more useful to stick to 32 bit for diagnostics
      - mesa-utils:i386

# Retrieved from ubuntu mesa-utils x86_64 8.4.0-1 (bionic)
/usr/local/bin/glxinfo.x86_64:
  file.managed:
    - source: salt://glxinfo.x86_64
    - mode: 755

steamvr-kisak:
  pkgrepo.managed:
    - ppa: kisak/steamvr

steamvr-kisak-packages:
  pkg.latest:
    - pkgs:
      - linux-lowlatency-steamvr-18.04
