resource "vault_policy" "this" {
  count = var.policy_definitions == null ? 0 : 1
  name   = replace("${try(var.backend.path, var.backend)}_${var.name}", "/", "-")
  policy = join("\n\n", var.policy_definitions)
}

resource "vault_jwt_auth_backend_role" "this" {
  backend      = try(var.backend.path, var.backend)
  role_name    = var.name
  role_type    = var.role_type
  user_claim   = var.user_claim
  bound_claims = var.bound_claims
  token_policies = concat(vault_policy.this[*].name, var.policies)
  token_ttl = var.token_ttl
}