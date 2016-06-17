# Don't use pip from package manager, it's critically outdated on too many distros
# http://stackoverflow.com/questions/27711184/why-is-pip-raising-an-assertionerror-on-pip-freeze
# I also ran into this while switching: https://github.com/saltstack/salt/issues/33163

# enforce this version at all times
"python /srv/salt/get-pip.py ; pip install -I pip==8.1.1":
  cmd.run:
    - unless: pip --version | grep 8.1.1

# make sure the system installed pip doesn't get called
# forcing the package to never be installed doesn't work out, too many things expect it
"mv /usr/bin/pip /usr/bin/pip.off":
  cmd.run:
    - unless: file /usr/bin/pip
