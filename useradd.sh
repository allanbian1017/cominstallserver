#!/bin/bash

for row in `more $1`
do
  USER=${row%:*}
  PASS=${row#*:}

  useradd -p `mkpasswd "$PASS"` -m -s /bin/bash "$USER"
done
