provider "vault" {
  address         = "http://127.0.0.1:8200"
  skip_tls_verify = true
  token           = "education"
}
data "vault_generic_secret" "vault_example" {
  path = "secret/example"
}

resource "vault_generic_secret" "new" {
  path = "secret/new_keys"

  data_json = <<EOT
{
  "test1":   "qwerty123",
  "test2": "wertyu578"
}
EOT
}

output "vault_example" {
  value = nonsensitive(data.vault_generic_secret.vault_example.data)
} 
