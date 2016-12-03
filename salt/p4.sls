/usr/local/bin/p4:
  file.managed:
    - source: salt://p4/p4
    - mode: 755

# NOTE: Haven't found a way without this rather unsafe and unnecessary copy
/tmp/p4v.tgz:
  file.managed:
    - source: salt://p4/p4v.tgz

/opt/p4v-2015.2.1458499:
  cmd.run:
    - name: "tar xvzf /tmp/p4v.tgz"
    - cwd: /opt

/usr/local/bin/p4v:
  file.symlink:
    - target: /opt/p4v-2015.2.1458499/bin/p4v
