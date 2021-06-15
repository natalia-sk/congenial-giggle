terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "us-west-2"
  alias   = "a1"
}

provider "aws" {
  profile = "default"
  region  = "eu-central-1"
  alias   = "a2"
}

resource "aws_instance" "app_server1" {
  ami           = "ami-0800fc0fa715fdcfe"
  instance_type = "t2.micro"
  provider      = aws.a1

  tags = {
    Name = "ExampleAppServerInstance1"
  }
}

resource "aws_instance" "app_server2" {
  ami           = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  provider      = aws.a2

  tags = {
    Name = "ExampleAppServerInstance2"
  }
}

resource "aws_instance" "app_server3" {
  ami           = "ami-0bad4a5e987bdebde"
  instance_type = "t2.micro"
  provider      = aws.a2

  tags = {
    Name = "ExampleAppServerInstance3"
  }
}
