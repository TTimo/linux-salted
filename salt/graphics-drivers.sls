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
      - vulkan-utils
      - libvulkan1
      - libvulkan1:i386

{% endif %}

{% if salt['cmd.retcode']('/bin/bash -c "/usr/bin/lspci | grep -i radeon"') == 0 %}

padoka:
  pkgrepo.managed:
    - ppa: paulo-miguel-dias/mesa

# See https://bugs.freedesktop.org/show_bug.cgi?id=104928
# "libglvnd_1.0.0 disables amdgpu direct rendering"
# symptoms: OpenGL renderer string out of glxinfo says 'llvmpipe'
# (WW) AMDGPU(0): Direct rendering disabled in Xorg log
libegl-mesa0:
  pkg.installed

# Might as well ditch those too, their presence is possibly related to the bug mentioned above
"apt remove 'libnvidia-*'":
  cmd.run

vulkan-packages:
  pkg.latest:
    - refresh: True
    - pkgs:
      - vulkan-utils
      - mesa-vulkan-drivers

{% endif %}
