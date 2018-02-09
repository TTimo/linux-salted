#!/bin/bash -e
# NOTE: this generates a new file every time, even if content hasn't changed
# (mime multipart uses some random uuid between the parts)
# If you need run-parts, it's in debianutils package (even available on macports)

# How to use this in EC2:
# Under 'Instance Details', 'Advanced Details' supply the user data as file, and mark it 'already base64 encoded'

# cloud-init fails if you don't base64 encode, possibly because EC2 prepends it's own user data?
# see https://github.com/terraform-providers/terraform-provider-aws/issues/183

run-parts --list scripts | xargs ./write-mime-multipart -z | base64 > user-data.payload.gz.base64
