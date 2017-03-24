# compile synergy with crypto support, jump through various setup problems
# https://twitter.com/TTimo/status/679680010228125697
# synergyc --enable-crypto <host>

# See https://wiki.archlinux.org/index.php/synergy

{% set user = salt['pillar.get']('default-user') %}
{% set home = salt['user.info'](user).get('home') %}

synergy-build-packages:
  pkg.installed:
    - pkgs:
      - cmake
      - libcurl4-gnutls-dev
      - libxtst-dev
      - libssl-dev

{% if not salt.file.file_exists('/usr/local/bin/synergyc') %}
      
https://github.com/symless/synergy.git:
  git.latest:
    - target: {{ home }}/synergy
    - rev: v1.8.8-stable
    - force_reset: True
    - user: {{ user }}

sh -c "mkdir gmock-1.6.0 ; cd gmock-1.6.0 && unzip -o ../gmock-1.6.0.zip":
  cmd.run:
    - cwd: {{ home }}/synergy/ext
    - user: {{ user }}

sh -c "mkdir gtest-1.6.0 ; cd gtest-1.6.0 && unzip -o ../gtest-1.6.0.zip":
  cmd.run:
    - cwd: {{ home }}/synergy/ext
    - user: {{ user }}

sh -c "rm -f CMakeCache.txt && ./configure":
  cmd.run:
    - cwd: {{ home }}/synergy
    - user: {{ user }}

make:
  cmd.run:
    - cwd: {{ home }}/synergy
    - user: {{ user }}

/usr/local/bin/synergyc:
  file.copy:
    - source: {{ home }}/synergy/bin/synergyc

{% endif %}

# see https://github.com/symless/synergy/issues/4626
/home/timo/.synergy/SSL/Fingerprints/TrustedServers.txt:
  file.managed:
    - source:
      - salt://TrustedServers.txt
    - user: {{ user }}
    - group: {{ user }}
    - makedirs: True
