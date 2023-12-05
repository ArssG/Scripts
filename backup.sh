#!/bin/bash

#This script archieve and compress some important folders and save it in a bucket

#Saving /etc which is stored configuration files

date=$(date +"%Y-%m-%d---%H-%M-%S")



local_path="/var/backup_files/"
bucket_path="bucket_link"

#Saving /var where is stored logs, databases and emails
tar -czvf /home/user/backups/backup_var_"$date".tar.gz /var
gsutil mv /home/user/backups/backup_var_"$date".tar.gz "$bucket_path"backups_for_"$date"/backup_var_"$date".tar.gz

#Saving /etc
tar -czvf /var/backup_files/backup_etc_"$date".tar.gz /etc
gsutil mv "$local_path"backup_etc_"$date".tar.gz "$bucket_path"backups_for_"$date"/backup_etc_"$date".tar.gz


#Saving /home which is stored the users directories
tar -czvf /var/backup_files/backup_home_"$date".tar.gz /home
gsutil mv "$local_path"backup_home_"$date".tar.gz "$bucket_path"backups_for_"$date"/backup_home_"$date".tar.gz

#Saving /usr/local where is stored local software installed
tar -czvf /var/backup_files/backup_userlocal_"$date".tar.gz /usr/local
gsutil mv "$local_path"backup_userlocal_"$date".tar.gz "$bucket_path"backups_for_"$date"/backup_userlocal_"$date".tar.gz

#Saving /root where is stored the directory of the root user
tar -czvf /var/backup_files/backup_root_"$date".tar.gz /root
gsutil mv "$local_path"backup_root_"$date".tar.gz "$bucket_path"backups_for_"$date"/backup_root_"$date".tar.gz

#Saving /boot where is stored system kernel and files needed to boot
tar -czvf /var/backup_files/backup_boot_"$date".tar.gz /boot
gsutil mv "$local_path"backup_boot_"$date".tar.gz "$bucket_path"backups_for_"$date"/backup_boot_"$date".tar.gz
