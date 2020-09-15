provider "aws" {
  region = "us-east-1"
}

provider "aws" {
  region = "us-west-1"
  alias  = "west"
}

module "vpc" {
  source = "./modules/vpc"
  providers = {
    aws = aws.west
  }
}
module "subnet" {
  source = "./modules/subnet"
  vpc_a  = module.vpc.first_vpc_out
  vpc_b  = module.vpc.second_vpc_out
}

module "ec2" {
  source        = "./modules/ec2"
  first_subnet  = module.subnet.first_sub_out
  second_subnet = module.subnet.second_sub_out
}



