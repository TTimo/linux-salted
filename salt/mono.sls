mono-pkg:
  pkg.installed:
    - pkgs:
        - mono-runtime

# cargo cult!
# http://stackoverflow.com/questions/24872394/access-to-the-path-etc-mono-registry-is-denied
# UE4 4.7 compiles errored out about this path not existing
/etc/mono/registry:
  file.directory:
    - makedirs: True
    - mode: 777
