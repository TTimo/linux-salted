ssh-server-installed:
  pkg.installed:
    - pkgs:
      - openssh-server

sshd_config-edit1:
  file.line:
    - name: /etc/ssh/sshd_config
    - mode: replace
    - match: "PermitRootLogin.*"
    - content: "PermitRootLogin no"

sshd_config-edit2:      
  file.line:
    - name: /etc/ssh/sshd_config
    - mode: replace
    - match: "ChallengeResponseAuthentication.*"
    - content: "ChallengeResponseAuthentication no"

sshd_config-edit3:
  file.line:
    - name: /etc/ssh/sshd_config
    - mode: replace
    - match: "PasswordAuthentication.*"
    - content: "PasswordAuthentication no"
