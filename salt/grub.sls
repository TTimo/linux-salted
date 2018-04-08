/etc/default/grub_default:
  file.line:
    - name: /etc/default/grub
    - mode: replace
    - match: "GRUB_DEFAULT.*"
    - content: "GRUB_DEFAULT=saved"

/etc/default/grub_savedefault:
  file.line:
    - name: /etc/default/grub
    - mode: replace
    - match: "GRUB_SAVEDEFAULT.*"
    - content: "GRUB_SAVEDEFAULT=true"

update-grub:
  cmd.run:
    - onchanges:
      - file: /etc/default/grub


