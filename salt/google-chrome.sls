google-chrome:
  pkgrepo.managed:
    - name: deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main
  pkg.latest:
    - name: google-chrome-beta
    - refresh: True
