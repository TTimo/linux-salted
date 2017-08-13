ChocolateyBoostrap:
  module.run:
    - name: chocolatey.bootstrap

# not working? despite chocolatey bootstrapped?
#ChocoGit:
#  chocolatey.installed:
#    - name: git

ChocoGit:
  module.run:
    - name: chocolatey.install
    - m_name: git

ChocoPython:
  module.run:
    - name: chocolatey.install
    - m_name: python2

ChocoMSVC:
  module.run:
    - name: chocolatey.install
    - m_name: visualstudio2015community
