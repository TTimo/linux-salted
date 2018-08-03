steam:
  pkgrepo.managed:
    - name: deb http://repo.steampowered.com/steam precise steam
  pkg.installed:
    - name: steam:i386
    # Ubuntu uses an Epoch on their steam package, which causes the official version to not be recognized as an upgrade
    - version: 1.0.0.55

# The steam startup scripts will want to install this if we don't.
steam-deps:
  pkg.latest:
    - name: libgl1-mesa-glx:i386
    - refresh: True

