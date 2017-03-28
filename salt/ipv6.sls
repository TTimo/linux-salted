# Disable IPv6. Unless you actually need it, it's the right thing to do.
# It tends to break things in subtle, hard to diagnose ways.
# https://bugzilla.redhat.com/show_bug.cgi?id=1343091
# I've also seen it mess up java apps.

/etc/sysctl.conf:
  file.blockreplace:
    - content: |
        net.ipv6.conf.all.disable_ipv6 = 1
        net.ipv6.conf.default.disable_ipv6 = 1
        net.ipv6.conf.lo.disable_ipv6 = 1
    - append_if_not_found: True
