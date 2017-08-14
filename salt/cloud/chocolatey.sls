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

# not sure if necessary, comes with the python install
# but fails to install the scons package?
ChocoPip:
  module.run:
    - name: chocolatey.install_python
    - m_name: pip

# this fails I think:
# actually, it seems to attempt installing scons against python3 .. where did python3 come from??
scons:
  pip.installed:
    - name: scons
    - use_wheel: True
