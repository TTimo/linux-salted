/usr/local/bin/p4:
  file.managed:
    - source: salt://p4/p4
    - mode: 755

{% set dirname = 'p4v-2018.1.1637591' %}
      
/opt/{{ dirname }}:
  archive.extracted:
    - source: salt://p4/p4v.tgz
    - name: /opt

/usr/local/bin/p4v:
  file.symlink:
    - target: /opt/{{ dirname }}/bin/p4v
