ChocolateyBoostrap:
  module.run:
    - name: chocolatey.bootstrap

ChocoGit:
  chocolatey.installed:
    - name: git

ChocoPython:
  chocolatey.installed:
    - name: python2

ChocoMSVC:
  chocolatey.installed:
    - name: visualstudio2015community

ChoConemu:
  chocolatey.installed:
    - name: conemu

ChocoCygwin:
  chocolatey.installed:
    - name: cygwin

# trying to use chocolatey.install_python fails (setup.py for scons too hold, uses options that pip isn't comfortable with)
# trying to use saltstack's pip facilities implies python3, not supported in scons
# NOTE: should extend this to check if already installed
install_scons:
  cmd.run:
    - name: "C:\\Python27\\Scripts\\pip.exe install --egg scons"

ChocoSVN:
  chocolatey.installed:
    - name: svn

ChocoZip:
  module.run:
    - name: chocolatey.install_cygwin
    - m_name: zip
