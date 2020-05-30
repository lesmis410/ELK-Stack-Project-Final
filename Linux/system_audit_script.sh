ipp=$(ifconfig | head -2 | tail -1 | awk -F" " '{print $2}')
cpin=$(lscpu | head -2)
dusk=$(df -H)
hostn=$(hostname)
minfo=$(uname -a)
psaux=$(ps -aux)
freem=$(free)
echo "*A Quick System Audit*"
date 

echo "*Machine Type Info:" $MACHTYPE

echo "*IP Info:" $ipp

echo "*CPU Information:" 
lscpu | head -2

echo "*Hostname:" $hostn

echo "*DNS Server:"
cat /etc/resolv.conf | tail -2


echo "*Free Memory:" 
free


echo  "*Disk Usage:" 
df -H

echo "Top 10 Processes"
ps -aux


echo -e > System_Audit.txt
cat System_Audit.txt
