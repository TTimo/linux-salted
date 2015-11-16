base:
  '*':
    - general
    - emacs
    # package has a dependency problem on ubuntu 15 apparently
    #- mosh
    - fish
    # https://github.com/ahdinosaur-os/google-chrome-formula
    # TODO: git clone to /srv/formula, or find a better way than the symlink
    - google-chrome
    # https://github.com/gspe/dropbox-formula
    # failing as well - https://github.com/gspe/dropbox-formula/issues/1
    - dropbox
