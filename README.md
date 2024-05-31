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
