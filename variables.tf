variable "name" {}

variable "backend" {}

variable "policies" {
  type = list(string)
  default = []
  nullable = false
}

variable "policy_definitions" {
  type = list(string)
  default = null
}

variable "role_type" {
  default = "jwt"
  nullable = false
}

variable "user_claim" {
  default = "actor"
  nullable = false
}

variable "bound_claims" {
  type = map(string)
}

variable "token_ttl" {
  default = 3600
  nullable = false
}