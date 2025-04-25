terraform {
  required_version = ">= 1.0.0" # Ensure that the Terraform version is 1.0.0 or higher

  required_providers {
    aws = {
      source = "hashicorp/aws" # Specify the source of the AWS provider
      version = "~> 4.0"        # Use a version of the AWS provider that is compatible with version
    }
  }
}

provider "aws" {
  region = "us-east-1" # Set the AWS region to US East (N. Virginia)
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
# ... other VPC, subnet, and gateway resources
resource "aws_ecs_cluster" "loopbill" {}
resource "aws_lb" "app" {
  name               = "loopbill-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = aws_subnet*public*id
}
# ... target group, listener, ECS service definitions