/etc/sysctl.d/10-ptrace.conf:
  file.line:
    - mode: replace
    - match: "ptrace_scope = 1"
    - content: "kernel.yama.ptrace_scope = 0"
