variable "name" {}

variable "backend" {}

variable "policy_definitions" {}

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