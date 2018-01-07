#!/bin/bash

sed -i 's/\r$//' $1

for row in `more $1`
do
  USER=${row%:*}
  PASS=${row#*:}

  useradd -p `mkpasswd "$PASS"` -m -s /bin/bash "$USER"
  mkdir -p /home/$USER/web
  chown $USER:$USER /home/$USER/web
  ln -s /home/$USER/web /var/www/html/$USER
done
