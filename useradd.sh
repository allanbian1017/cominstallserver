#!/bin/bash

sed -i 's/\r$//' $1

for row in `more $1`
do
  USER=${row%:*}
  PASS=${row#*:}

  useradd -p `mkpasswd "$PASS"` -m -s /bin/bash "$USER"
done
