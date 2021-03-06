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

{% else %} # ChocolateyBootstrap

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

{% endif %} # ChocolateyGlobalConfirmation

# Install python before considering the salt-minion upgrade

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

# This doesn't seem to take
Python36:
  chocolatey.installed:
    - name: python3
    - package_args: "-allow-downgrade --version 3.6.8"
    # Maybe it doesn't take because of this?
#    - override_args: True

# Bring the salt minion under chocolatey:
# In order to reinstall/upgrade salt under choco, salt-minion service needs to be stopped
# That would normally kill and abort any command that is running
# So I wrote this script that will respawn a child process in such a way that it doesn't get killed when salt stops
# This will start detecting that saltminion has been installed/upgraded under chocolatey:
{% set test = salt['cmd.run']('choco list --local-only saltminion') %}
{% if test.find('0 packages') != -1 %}

C:/salt-choco-minion.py:
  file.managed:
    - source: salt://cloud/salt-choco-minion.py
  cmd.run:
    - name: "C:/Python37/python.exe C:/salt-choco-minion.py"

{% else %} # Salt has been upgraded and brought under chocolatey, do the big install work now

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

vscode:
  chocolatey.installed:
    - name: vscode

WindowsSDK:
  chocolatey.installed:
    - name: windows-sdk-8.1

dotnet4.5:
  chocolatey.installed:
    - name: dotnet4.5

# This may not be enough for the 4.6.2 SDK and 4.6.2 Targeting Pack
# Or maybe a reboot is required
dotnet4.6.2:
  chocolatey.installed:
    - name: dotnet4.6.2

Firefox:
  chocolatey.installed:
    - name: firefox

Git:
  chocolatey.installed:
    - name: git

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

1password:
  chocolatey.installed:
    - name: 1password

P4:
  chocolatey.installed:
    - name: p4

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

processhacker:
  chocolatey.installed:
    - name: processhacker

hwmonitor:
  chocolatey.installed:
    - name: hwmonitor

gyazo:
  chocolatey.installed:
    - name: gyazo

{% endif %} # !SaltedChocolatey

{% endif %} # !ChocolateyBoostrap
