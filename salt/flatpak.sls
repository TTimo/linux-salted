flatpak-packages:
  pkgrepo.managed:
    - ppa: alexlarsson/flatpak
  pkg.latest:
    - refresh: True
    - pkgs:
      - flatpak
      - flatpak-builder

# confirm that this works? not completely sure it's setup right
flatpak-flathub:
  cmd.run:
    - name: flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    - onchanges:
      - flatpak-packages
