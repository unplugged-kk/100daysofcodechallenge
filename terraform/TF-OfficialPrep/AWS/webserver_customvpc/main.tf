#AWS Provider
provider "aws" {
  region = "us-east-1"
}

#VPC

module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "terraform_vpc"
}

#SUBNET

module "subnet" {
  source   = "./modules/subnet"
  vpc_id   = module.vpc.out_vpc_id
  sub_cidr = "10.0.1.0/24"
  sub_az   = "us-east-1a"
  sub_name = "tf_web_sub"
}

#Internet gateway

module "igw" {
  source = "./modules/igw"
  vpc_id = module.vpc.out_vpc_id
}

#Route Table

module "rtb" {
  source   = "./modules/rtb"
  vpc_id   = module.vpc.out_vpc_id
  igw_id   = module.igw.out_igw_id
  rtb_name = "tf_web_rtb"
}

#Route Table association 

module "rtbas" {
  source = "./modules/rtbas"
  sub_id = module.subnet.out_sub_id
  rtb_id = module.rtb.out_rtb_id
}


#Key association 

module "tf_key" {
  source = "./modules/tf_key"
}


#Security Group

module "sg" {
  source  = "./modules/sg"
  vpc_id  = module.vpc.out_vpc_id
  sg_name = "tf_web_sg"
}

# EIP

# Elastic IP
module "eip" {
  source   = "./modules/eip"
  eip_vpc  = "true"
  eip_name = "tf_eip"
}

# EC2 Instance
module "ec2" {
  source         = "./modules/ec2"
  ec2_ami        = "ami-0761dd91277e34178"
  ec2_type       = "t2.micro"
  ec2_az         = "us-east-1a"
  ec2_name       = "ec2_webserver"
  ec2_key_name   = module.tf_key.out_tf_key_id
  ec2_sub_id     = module.subnet.out_sub_id
  ec2_sg_id      = module.sg.out_sg_id
  ec2_depends_on = [module.eip.out_eip_id]
}

# EIP Association

module "eip_associate" {
  source                     = "./modules/eip_associate"
  instance_id                = module.ec2.out_ec2_id
  eip_id                     = module.eip.out_eip_id
  eip_association_depends_on = [module.ec2.out_ec2_id]
}
