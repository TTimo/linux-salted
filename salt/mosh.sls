# https://mosh.mit.edu/

# NOTE: mosh does not support agent forwarding without some trickery
# see https://github.com/keithw/mosh/issues/120
# what you can do:
# ssh -A -o TCPKeepAlive=yes user@host
# and leave it open, then look at SSH_AUTH_SOCK env var
# connect through mosh and set the same SSH_AUTH_SOCK

mosh_mobile_shell:
  pkgrepo.managed:
    - ppa: keithw/mosh
  pkg.installed:
    - name: mosh

