base:
  '*':
    - general
    - emacs
    # package has a dependency problem on ubuntu 15 apparently
    #- mosh
    - fish
    # https://github.com/ahdinosaur-os/google-chrome-formula
    # TODO: git clone to /srv/formula as a depend, or find a better way than the symlink
    - google-chrome
    - graphics-drivers
    - dropbox
