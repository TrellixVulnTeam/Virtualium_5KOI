Content-Type: multipart/mixed; boundary="===============3192713444966269894=="
MIME-Version: 1.0
Number-Attachments: 1

--===============3192713444966269894==
MIME-Version: 1.0
Content-Type: text/cloud-config
Content-Disposition: attachment; filename="part-001"

#cloud-config
repo_update: true
repo_upgrade: all
runcmd:
- yum install -y amazon-efs-utils
- apt-get -y install amazon-efs-utils
- yum install -y nfs-utils
- apt-get -y install nfs-common
- file_system_id_1=fs-8cfaa80f
- efs_mount_point_1=/mnt/efs/fs1
- mkdir -p "${efs_mount_point_1}"
- test -f "/sbin/mount.efs" && echo "${file_system_id_1}:/ ${efs_mount_point_1} efs tls,_netdev" >> /etc/fstab || echo "${file_system_id_1}.efs.us-east-1.amazonaws.com:/ ${efs_mount_point_1} nfs4 nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport,_netdev 0 0" >> /etc/fstab
- test -f "/sbin/mount.efs" && echo -e "\n[client-info]\nsource=liw" >> /etc/amazon/efs/efs-utils.conf
- mount -a -t efs,nfs4 defaults

--===============3192713444966269894==--