output "VPC_ID" {
  value = module.vpc.out_vpc_id
}

output "SUBNET_ID" {
  value = module.subnet.out_sub_id
}

output "IGW_ID" {
  value = module.igw.out_igw_id
}

output "RTB_ID" {
  value = module.rtb.out_rtb_id
}

output "RTBAS_ID" {
  value = module.rtbas.out_rtbas_id
}

output "SG_ID" {
  value = module.sg.out_sg_id
}

output "TF_KEY_ID" {
  value = module.tf_key.out_tf_key_id
}

output "EC2_ID" {
  value = module.ec2.out_ec2_id
}

output "EC2_PIP" {
  value = module.ec2.out_ec2_pip
}

output "EC2_EIP" {
  value = module.eip.out_eip_id
}

output "EC2_EIP_PUB" {
  value = module.eip.out_eip_id_pub
}
