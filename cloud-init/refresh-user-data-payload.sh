#!/bin/bash -e
# NOTE: this generates a new file every time, even if content hasn't changed
# (mime multipart uses some random uuid between the parts)

echo "Updating user-data.payload.gz"

cd scripts
run-parts --list . | xargs ../write-mime-multipart -z > ../user-data.payload.gz

