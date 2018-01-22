# TODO: reboot after install
ChocolateyBoostrap:
  module.run:
    - name: chocolatey.bootstrap

Chrome:
  chocolatey.installed:
    - name: googlechrome

Firefox:
  chocolatey.installed:
    - name: firefox

MSVC2017:
  chocolatey.installed:
    - name: visualstudio2017community

MSVC2017-workload-nativedesktop:
  chocolatey.installed:
    - name: visualstudio2017-workload-nativedesktop

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

# FIXME: I have not been able to convert this to the pip.installed with bin_env method
# fails with "error: option --single-version-externally-managed not recognized"
Scons:
  cmd.run:
    - name: "C:\\Python27\\Scripts\\pip.exe install --egg scons"

Boto:
  pip.installed:
    - name: boto3
    - bin_env: "C:\\Python27\\Scripts\\pip.exe"
