#!bin/bash
#swapon /dev/vdb1
VDBNUM=`df -h |grep "/dev/vdb1" |wc -l`
if [ $VDBNUM -eq 1 ];then
    cd /data/
    rm -rf *
elif [ $VDBNUM -eq 0 ];then
fdisk /dev/vdb <<EOF
n
p
1


w
EOF
mkfs.ext4 /dev/vdb1
#echo "/dev/vdb1 swap swap defaults 0 0" >> /etc/fstab
echo "/dev/vdb1               /data                   ext4    defaults        0 0" >> /etc/fstab
mkdir /data
mount -a
fi
