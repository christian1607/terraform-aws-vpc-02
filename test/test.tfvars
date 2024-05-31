
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
