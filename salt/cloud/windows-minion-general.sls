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

# There has to be a better way to do this with onlyif, rather than using macros..
{% if grains.get('ChocolateyGlobalConfirmation') != 'done' %}

# Don't get prompted yes/no/whatever when issuing chocolatey commands
ChocolateyAllowGlobalConfirmation:
  cmd.run:
    - name: "choco feature enable -n allowGlobalConfirmation"

ChocolateyGlobalConfirmationGrain:
  module.run:
    - name: grains.setval
    - key: ChocolateyGlobalConfirmation
    - val: done
    - watch:
      - ChocolateyAllowGlobalConfirmation

{% endif %}

Chrome:
  chocolatey.installed:
    - name: googlechrome

# I was installing it on some machines, but turns out I don't want it
# Chrome Remote Desktop a better option overall
NoUltraVNC:
  chocolatey.uninstalled:
    - name: ultravnc

# This throws an error atm, causes unclear
visualstudio2017community:
  chocolatey.installed:
    - name: visualstudio2017community

visualstudio2017-workload-nativedesktop:
  chocolatey.installed:
    - name: visualstudio2017-workload-nativedesktop

WindowsSDK:
  chocolatey.installed:
    - name: windows-sdk-8.1

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

CygwinWget:
  module.run:
    - name: chocolatey.install_cygwin
    - m_name: wget
      
Conemu:
  chocolatey.installed:
    - name: conemu

# We need to be explicit about python 2 and 3,
# Otherwise it tries to upgrade 2 to 3 and things don't go well
NoGenericPython:
  chocolatey.uninstalled:
    - name: python

Python2:
  chocolatey.installed:
    - name: python2

Python3:
  chocolatey.installed:
    - name: python3

boto3:
  pip.installed:
    - name: boto3
    - bin_env: "C:\\Python27\\Scripts\\pip.exe"

BotoPython3:
  pip.installed:
    - name: boto3
    - bin_env: "C:\\Python36\\Scripts\\pip.exe"

AWS:
  chocolatey.installed:
    - name: awscli

CMake:
  chocolatey.installed:
    - name: cmake

# FIXME: I have not been able to convert this to the pip.installed with bin_env method
# fails with "error: option --single-version-externally-managed not recognized"
#Scons:
#  cmd.run:
#    - name: "C:\\Python27\\Scripts\\pip.exe install --egg scons"

emacs:
  chocolatey.installed:
    - name: emacs

cyg-get:
  chocolatey.installed:
    - name: cyg-get

Putty:
  chocolatey.installed:
    - name: putty
    
Dropbox:
  chocolatey.installed:
    - name: dropbox

P4:
  chocolatey.installed:
    - name: p4
    
P4V:
  chocolatey.installed:
    - name: p4v

Araxis:
  chocolatey.installed:
    - name: araxismerge

InnoSetup:
  chocolatey.installed:
    - name: innosetup

spacesniffer:
  chocolatey.installed:
    - name: spacesniffer

nxlog:
  chocolatey.installed:
    - name: nxlog

{% endif %}
