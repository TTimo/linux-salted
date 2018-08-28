steam:
  pkg.installed:
    - name: steam:i386
    # Ubuntu uses an Epoch on their steam package, which causes the official version to not be recognized as an upgrade
    - version: 1.0.0.55

# the steam package insists on creating this entry,
# so we can't use pkgrepo.managed (which writes to /etc/apt/sources.list)
/etc/apt/sources.list.d/steam.list:
  file.managed:
    - source:
      - salt://steam.list  

# The steam startup scripts will want to install this if we don't.
steam-deps:
  pkg.latest:
    - name: libgl1-mesa-glx:i386
    - refresh: True

