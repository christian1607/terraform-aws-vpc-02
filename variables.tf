variable "cidr_block" {
  description = "Rango de IPs a utilizar (Formato CIDR)"
  type = string
}

variable "codigo_app" {
  description = "Codigo de 4 digitos del aplicativo"
  type = string

  validation {
    condition = length(var.codigo_app) == 4
    error_message = "El codgio de app debe ser de 4 digitos"
  }
}

variable "public_subnets" {
  description = "Mapa de subnets publicas a crear"
  type = map(any)
}

variable "private_subnets" {
  description = "Mapa de subnets publicas a crear"
  type = map(any)
}