Modulo VPC

Este modulo permite la creacion de componentes de networking usados para EKS

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Rango de IPs a utilizar (Formato CIDR) | `string` | n/a | yes |
| <a name="input_codigo_app"></a> [codigo\_app](#input\_codigo\_app) | Codigo de 4 digitos del aplicativo | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Mapa de subnets publicas a crear | `map(any)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Mapa de subnets publicas a crear | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_private_data"></a> [subnet\_private\_data](#output\_subnet\_private\_data) | n/a |
| <a name="output_subnet_public_data"></a> [subnet\_public\_data](#output\_subnet\_public\_data) | n/a |

Cualquier consultar con el equipo de infra: infra@dominio.com

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_eip.ip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_internet_gateway.igw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.nat](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.privada](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table.publica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_route_table_association.privado](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_route_table_association.publica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table_association) | resource |
| [aws_subnet.privada](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_subnet.publica](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr_block"></a> [cidr\_block](#input\_cidr\_block) | Rango de IPs a utilizar (Formato CIDR) | `string` | n/a | yes |
| <a name="input_codigo_app"></a> [codigo\_app](#input\_codigo\_app) | Codigo de 4 digitos del aplicativo | `string` | n/a | yes |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Mapa de subnets publicas a crear | `map(any)` | n/a | yes |
| <a name="input_public_subnets"></a> [public\_subnets](#input\_public\_subnets) | Mapa de subnets publicas a crear | `map(any)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnet_private_data"></a> [subnet\_private\_data](#output\_subnet\_private\_data) | n/a |
| <a name="output_subnet_public_data"></a> [subnet\_public\_data](#output\_subnet\_public\_data) | n/a |
<!-- END_TF_DOCS -->