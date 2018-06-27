google-chrome:
  pkgrepo.managed:
    - name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
    # see https://www.google.com/linuxrepositories/
    - key_url: https://dl.google.com/linux/linux_signing_key.pub
  pkg.latest:
    - name: google-chrome-beta
    - refresh: True
