#!/bin/bash

# requires:
#	- awscli (pip install awscli)
#	- ~/.aws/config file (can be setup by running `aws configure`)
#	- ~/.aws/credentials files (can be setup by running `aws configure`)

# This script takes one argument:
#	key pair name - The name of the key pair (without the .pem extension) that
#			should be used to create the instance. This key pair should
#			be located in the ~/.aws/key_pairs directory (with the .pem
#			extension. i.e. ~/.aws/key_pairs/my_key_pair.pem)
# Example: $source launch_windows_instance.sh my_key_pair

instance_id=$(aws ec2 run-instances \
	--image-id ami-06a4e829b8bbad61e \
	--count 1 \
	--instance-type t2.micro \
	--key-name $1 |\
	grep InstanceId |\
	awk 'BEGIN {FS=":";} { print $2 }' |\
	awk '{gsub("\"",""); print $1}' |\
	awk '{gsub(",",""); print $1}')

printf "Initializing Windows instance $instance_id\n\n"

printf "Go to the 'Instances' tab within the EC2 dashboard on AWS, select the"
printf "\n$instance_id instance and click 'Connect' and then 'Get Password'.\n"
printf "Paste the below private key:\n\n"

cat ~/.aws/key_pairs/$1.pem

printf "\n\nOnce the password is decrypted, use the Public DNS, User name, and\n" 
printf "decrypted password to create a new desktop using Microsoft Remote \n"
printf "Desktop and connect.\n"
