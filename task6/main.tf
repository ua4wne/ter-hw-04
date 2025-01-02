# To always have a unique bucket name in this example
resource "random_string" "unique_id" {
  length  = 8
  upper   = false
  lower   = true
  numeric = true
  special = false
}

module "s3" {
  source = "git@github.com:ua4wne/terraform-yc-s3.git?ref=master"

  bucket_name = "simple-bucket-${random_string.unique_id.result}"
  max_size    = 1073741824 // 1Gb
  # бросало ошибку!!!
  # versioning = {
  #   enabled = true
  # }
}
