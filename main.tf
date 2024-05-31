resource "aws_vpc" "vpc" {
    cidr_block = var.cidr_block

    #checkov:skip=CKV2_AWS_11:El VPC solo sera usado en desarrollo
    #checkov:skip=CKV2_AWS_12:El NSG si requeire tener acceso hacia internet
    tags = {
      Name = "${var.codigo_app}-vpc"
      Project = "htfc"
      Env = "Desa"  
    }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
}


resource "aws_subnet" "publica" {
  
  for_each = var.public_subnets

  vpc_id = aws_vpc.vpc.id
  cidr_block = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]

  tags = merge( {Name = "${var.codigo_app}-sn-pub"}, each.value["tags"])
  
}

resource "aws_subnet" "privada" {
  
  for_each = var.private_subnets

  vpc_id = aws_vpc.vpc.id
  cidr_block = each.value["cidr_block"]
  availability_zone = each.value["availability_zone"]

  tags = merge( {Name = "${var.codigo_app}-sn-priv"}, each.value["tags"]) 
}

resource "aws_eip" "ip" {
  for_each = aws_subnet.publica
  vpc = true
}

resource "aws_nat_gateway" "nat" {
  
  for_each = aws_subnet.publica

  allocation_id = aws_eip.ip[each.key].id
  subnet_id = each.value.id #  aws_subnet.publica[each.key].id

  tags = {
    Name = "${var.codigo_app}-nat"
  }
}

resource "aws_route_table" "publica" {
  
  vpc_id =  aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "${var.codigo_app}-rt-pub"
  }
}

resource "aws_route_table" "privada" {
  
  for_each = aws_subnet.publica

  vpc_id =  aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat[each.key].id
  }

  tags = {
    Name = "${var.codigo_app}-rt-priv"
  }
}

resource "aws_route_table_association" "publica" {
  
  for_each = aws_subnet.publica

  subnet_id = each.value.id
  route_table_id = aws_route_table.publica.id
}

resource "aws_route_table_association" "privado" {
  for_each = aws_subnet.privada

  subnet_id = each.value.id
  route_table_id = aws_route_table.privada[each.key].id
}
