#!/bin/bash

#This script create and snapshot in GCP for this instance
#This can be scheduled in GCP but i need to create various scripts for practice cron

date=$(date +"%Y-%m-%d--%H-%M-%S")

project="name_of_your project"

source_disk="disk_name"

disk_zone="disk_zone"

storage_zone="storage_zone"

gcloud compute snapshots create snapshot-"$date" --project="$project" --source-disk="$source_disk" --source-disk-zone="$disk_zone" --storage-location="$storage_zone" || echo "Error creating the snapshot"

