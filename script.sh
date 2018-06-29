#!/bin/bash
if [[ -f "/var/log/systemusage/process.log" ]]
then
echo "Exista fisierul"
else
touch /var/log/systemusage/process.log
echo "Am creat fisierul process.log"
fi

#Aici logam procesele
date +"%d %b %Y %H":"%M":"%S":"" >> /var/log/systemusage/process.log
top -b -n1 -o "%CPU" | head -n12 |tail -n5 | awk '{print$12" " $1 " " $9}'>>/var/log/systemusage/process.log

#Verificam disk.log
if [[ -f "/var/log/systemusage/disk.log" ]]
then
echo "Exista fisierul"
else
touch /var/log/systemusage/disk.log
echo "Am creat fisierul disk.log"
fi

#Aici logam disk
date +"%d %b %Y %H":"%M":"%S":"">>/var/log/systemusage/disk.log
df -x tmpfs | awk '{print$1 "  " $5 "  " $6}'>>/var/log/systemusage/disk.log

#aici logam memoria
if [[ -f "/var/log/systemusage/memory.log" ]]
then
echo "Exista fisierul"
else
touch /var/log/systemusage/memory.log
echo "Am creat fisierul memory.log"
fi

#Aici logam memoria
date +"%d %b %Y %H":"%M":"%S":"" >> /var/log/systemusage/memory.log;free | grep Mem | awk '{print $1 " " $2 " " $3 " " $4 " " $5}'>>/var/log/systemusage/memory.log

#Aici logam loadul 

if [[ -f "/var/log/systemusage/load.log" ]]
then
echo "Exista fisierul"
else
touch /var/log/systemusage/load.log
echo "Am creat fisierul load.log"
fi

#Aici logam memoria
date +"%d %b %Y %H":"%M":"%S":"">>/var/log/systemusage/load.log
cat /proc/loadavg | awk '{print $1 " " $2 " " $3}'>>/var/log/systemusage/load.log
