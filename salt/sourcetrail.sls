# There is a sort of install script in the Sourcetrail archive, but I bypass it for the most part
# that install script is a little too primitive to be safe..

{% set version = '2018_3_13' %}

/opt/Sourcetrail_{{ version }}:
  archive.extracted:
    - source: salt://sourcetrail/Sourcetrail_{{ version }}_Linux_64bit.tar.gz
    - name: /opt/Sourcetrail_{{ version }}
    # salt seems to think there is not a single top level directory in the archive, which is incorrect
    - enforce_toplevel: false
    - options: --strip 1

/usr/local/bin/sourcetrail:
  file.symlink:
    - target: /opt/Sourcetrail_{{ version }}/Sourcetrail.sh
