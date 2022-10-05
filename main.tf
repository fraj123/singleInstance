## Configurar las variables para poder trabajar con el VPC default
locals {
  vpc_id = ""
  subnet_id = ""
  ssh_user = "ec2-user"
  key_name = ""
  private_key_path = ""
  name_instance = ""
  security_group = ""
}

provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "$HOME/.aws/credentials"
  profile = "default"
}

resource "aws_instance" "deploy-instance" {
  ami = "" # Configurar con el AMI adecuado gratuito 
  subnet_id = local.subnet_id
  instance_type = "t2.micro"
  associate_public_ip_address = true
  security_groups = [local.security_group]
  key_name = local.key_name

  tags = {
    Name = local.name_instance
  }

}

