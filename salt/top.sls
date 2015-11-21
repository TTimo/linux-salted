base:
  '*':
    - general
    - emacs
    # package has a dependency problem on ubuntu 15 apparently
    #- mosh
    - fish
    # git clone https://github.com/ahdinosaur-os/google-chrome-formula to /srv/formula, and make the symlink work
    - google-chrome
    - graphics-drivers
    - dropbox
    - lightdm
    - xmonad
 