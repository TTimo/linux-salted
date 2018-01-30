{% if grains.get('ChocolateyBootstrap') != 'done' %}

ChocolateyBootstrap:
  module.run:
    - name: chocolatey.bootstrap

ChocolateyBootstrapFence:
  module.run:
    - name: grains.setval
    - key: ChocolateyBootstrap
    - val: done
    - watch:
      - ChocolateyBootstrap

ChocolateyBootstrapReboot:
  module.run:
    - name: system.reboot
    - watch:
      - ChocolateyBootstrapFence

{% else %}

Chrome:
  chocolatey.installed:
    - name: googlechrome

# Experimented with this, but Chrome Remote Desktop outperforms by default
# May be optimizable with some tweaking (mirror drivers etc.)
UltraVNC:
  chocolatey.installed:
    - name: ultravnc

MSVC2017:
  chocolatey.installed:
    - name: visualstudio2017community

MSVC2017-workload-nativedesktop:
  chocolatey.installed:
    - name: visualstudio2017-workload-nativedesktop

Firefox:
  chocolatey.installed:
    - name: firefox

Git:
  chocolatey.installed:
    - name: git

SVN:
  chocolatey.installed:
    - name: svn

Cygwin:
  chocolatey.installed:
    - name: cygwin

CygwinZip:
  module.run:
    - name: chocolatey.install_cygwin
    - m_name: zip

CygwinFish:
  module.run:
    - name: chocolatey.install_cygwin
    - m_name: fish

Conemu:
  chocolatey.installed:
    - name: conemu

Python:
  chocolatey.installed:
    - name: python2

Boto:
  pip.installed:
    - name: boto3
    - bin_env: "C:\\Python27\\Scripts\\pip.exe"

AWS:
  chocolatey.installed:
    - name: awscli

CMake:
  chocolatey.installed:
    - name: cmake

# FIXME: I have not been able to convert this to the pip.installed with bin_env method
# fails with "error: option --single-version-externally-managed not recognized"
Scons:
  cmd.run:
    - name: "C:\\Python27\\Scripts\\pip.exe install --egg scons"

{% endif %}
