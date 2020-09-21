# Prerequesites

A GCP Account
Terraform installed in your PC/MAC/Linux
GCP Service account. create it and generate json key.

For terrafrom remote exec i have created ssh keys

To genetate ssh-key use below command

ssh-keygen -t rsa -b 4096 -f <filename>

Terraform best practices says not to add terraform.tfvars in github , i have just added for my learning purpose.It should be avoided in production.

modify terraform.tfvars as per your remote user name and path.

In bootstrap.sh script you should change the region incase you choose different region/zone. 