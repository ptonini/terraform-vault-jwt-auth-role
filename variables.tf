variable "name" {}

variable "backend" {}

variable "policies" {
  type = list(string)
  default = []
}

variable "policy_definitions" {
  type = list(string)
  default = null
}

variable "role_type" {
  default = "jwt"
}

variable "user_claim" {
  default = "actor"
}

variable "bound_claims" {}

variable "token_ttl" {
  default = 3600
}