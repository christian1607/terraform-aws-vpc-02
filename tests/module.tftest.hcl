
provider "aws" {
  region = "us-east-1"  
}


variables {
  codigo_app = "ct01"
  cidr_block = "10.0.0.0/16"
  public_subnets = {
    "subnet1" = {
      "cidr_block" = "10.0.0.0/24"
      "availability_zone" = "us-east-1a"
      "tags" = {
        "kubernetes.io/role/elb" = 1
      }
    },
    "subnet2" = {
      "cidr_block" = "10.0.1.0/24"
      "availability_zone" = "us-east-1b"
      "tags" = {
        "kubernetes.io/role/elb" = 1
      }
    }
    "subnet3" = {
      "cidr_block" = "10.0.2.0/24"
      "availability_zone" = "us-east-1c"
      "tags" = {
        "kubernetes.io/role/elb" = 1
      }
    }
  }
  private_subnets = {
    "subnet1" = {
      "cidr_block" = "10.0.100.0/24"
      "availability_zone" = "us-east-1a"
      "tags" = {
        "kubernetes.io/role/internal-elb" = 1
      }
    },
    "subnet2" = {
      "cidr_block" = "10.0.101.0/24"
      "availability_zone" = "us-east-1b"
      "tags" = {
        "kubernetes.io/role/internal-elb" = 1
      }
    }
    "subnet3" = {
      "cidr_block" = "10.0.102.0/24"
      "availability_zone" = "us-east-1c"
        "tags" = {
        "kubernetes.io/role/internal-elb" = 1
      }
    }
  }
}

run "test_valid_cidr" {
  
  command = apply

  #variables {
  #  cidr_block = "10.0.0.0/16"
  #}

  assert {
    condition     = aws_vpc.vpc.cidr_block == var.cidr_block
    error_message = "CIDR block is not equal as the one used in the varaibles"
  }

}

run "test_has_required_tags" {
  
  command = apply

  #variables {
  #  cidr_block = "10.0.0.0/16"
  #}

  assert {
    condition     = contains(keys(aws_vpc.vpc.tags), "Env")
    error_message = "The VPC does not contain Env tags"
  }
  
  assert {
    condition     = contains(keys(aws_vpc.vpc.tags), "Project")
    error_message = "The VPC does not contain Project tags"
  }
}


