resource "vault_policy" "this" {
  name   = replace("${try(var.backend.path, var.backend)}_${var.name}", "/", "_")
  policy = join("\n\n", var.policy_definitions)
}

resource "vault_jwt_auth_backend_role" "this" {
  backend      = try(var.backend.path, var.backend)
  role_name    = var.name
  role_type    = var.role_type
  user_claim   = var.user_claim
  bound_claims = var.bound_claims
  token_policies = [
    vault_policy.this.name
  ]
  token_ttl = var.token_ttl
}