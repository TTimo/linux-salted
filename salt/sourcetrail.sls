# There is a sort of install script in the Sourcetrail archive, but I bypass it for the most part
# that install script is a little too primitive to be safe..

/opt/Sourcetrail:
  archive.extracted:
    - source: salt://sourcetrail/Sourcetrail_2018_2_36_Linux_64bit.tar.gz
    - name: /opt

/usr/local/bin/sourcetrail:
  file.symlink:
    - target: /opt/Sourcetrail/Sourcetrail.sh
