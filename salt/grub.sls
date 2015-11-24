/etc/default/grub:
  file.line:
    - mode: replace
    - match: "GRUB_CMDLINE_LINUX_DEFAULT.*"
    - content: "GRUB_CMDLINE_LINUX_DEFAULT=\"\""

update-grub:
  cmd.run:
    - onchanges:
      - file: /etc/default/grub


