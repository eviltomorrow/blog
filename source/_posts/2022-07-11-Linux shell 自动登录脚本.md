---
title: Linux shell 登录 ssh 脚本
catalog: true
comments: true
date: 2022-07-05 09:00:00
subtitle: ssh 登录脚本
header-img: /img/header_img/home-bg-1-dark.jpg
tags:
    - Linux
categories:
    - 技术
---

# Linux shell 登录 ssh 脚本

## login-ssh.sh

```sh
#!/bin/bash

#show all host infos of server-list.txt
if [[ -f ./server-list.txt ]]; then
  hostNum=$(cat ./server-list.txt | wc -l)
else
  echo "No iplist in managerserver, please create it and add server infos."
  exit
fi

while [ True ]; do
  echo -e "+-------------------- Host List ---------------------------+"
  awk -F' ' 'BEGIN {print "ID\tServerName\t\tUser@Host\t    Port"}{printf("%2d -> [%s]  %s@%s  %s\n", NR,$1,$2,$3,$4)}' ./server-list.txt
  echo -e ""

  read hostID
  if [[ "$hostID" == 'q' ]] || [[ "$hostID" == 'Q' ]]; then
    exit
  elif [[ $hostID -lt 1 ]] || [[ $hostID -gt $hostNum ]]; then
    echo "Wrong hostID is selected, Only $hostNum hosts are listed, please check."
    continue
  else
    break
  fi
done

servername=""
user=""
host=""
passwd=""

eval $(awk -v hostID=$hostID -F' ' '{if (NR==hostID) {printf("servername=%s;user=%s;host=%s;port=%s;passwd=%s;",$1,$2,$3,$4,$5);}}' ./server-list.txt)

#echo $user, $host, $port, $passwd
echo "Info: login $servername by $user@$host $port"
expect -c "
  set timeout 10
  spawn ssh -p $port $user@$host
  expect {
  \"*yes/no\" { send \"yes\r\"; exp_continue }
  \"*?assword:\" { send \"$passwd\r\" }
  }
  interact
"
```

## server-ip.txt

```text
Server-192.168.x.x   root    192.168.x.x  22  root123
```