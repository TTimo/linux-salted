swappiness:
  file.blockreplace:
    - marker_start: '# -- start swappiness'
    - marker_end: '# -- end swappiness'
    - name: /etc/sysctl.conf
    - content: |
        vm.swappiness = 1
    - append_if_not_found: True
