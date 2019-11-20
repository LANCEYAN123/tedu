#!/bin/bash
while :
do
n=$(uptime | sed -n 's/.*://p')
echo "主机cpu平均负载时$n"
ifconfig eth0 | awk '/RX p/{print "主机的eth0的网卡接收流量是"$5"字节"}'
ifconfig eth0 | awk '/TX p/{print "主机的eth0的网卡发送流量是"$5"字节"}'
free -h | awk '/^Mem/{print "主机剩余内存是"$4}'
df -h | awk '/\/$/{print "根分区剩余容量是"$4}'
awk 'END{print "当前主机用户总量是"NR}'  /etc/passwd
w=$(who | wc -l)
echo "当前登录的账号数量是$w 个"
p=$(ps aux | wc -l)
echo "当前主机开启的进程数是$p 个"
r=$(rpm -qa | wc -l)
echo "当前主机安装软件包数量是$r 个"
sleep 3
clear
done
