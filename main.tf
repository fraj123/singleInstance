locals {
  vpc_id = "vpc-08ec"
  subnet_id = "subnet-01c68b2d541c535fd"
  ssh_user = "ec2-user"
  key_name = "jenkins-kp"
  private_key_path = "~/jenkins-kp.pem"
  name_instance = "deploy-instance"
  security_group = "sg-0576602e368f92441"
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile = "default"
}

resource "aws_instance" "deploy-instance" {
  ami = "ami-026b57f3c383c2eec"
  subnet_id = local.subnet_id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  security_groups = [local.security_group]
  key_name = local.key_name

  tags = {
    Name = local.name_instance
  }

}

