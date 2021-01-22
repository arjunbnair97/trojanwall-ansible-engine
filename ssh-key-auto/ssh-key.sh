#!/bin/bash
cnt=1
for each_server in $(cat list.txt)
do
  echo "Adding SSH Key"
  sshpass -f passd.txt ssh-copy-id ansadmin@${each_server}
  sshpass -f passd.txt ssh-copy-id centos@${each_server}

done
