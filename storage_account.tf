module "storage_account" {
  source = "./module/storage-account"

  name_prefix              = "inovocbdata"
  name_suffix              = "dev"
  generate_random_suffix   = true

  resource_group_name      = "rg-inovocb-dev"
  location                 = "canadacentral"

  account_tier             = "Standard"
  account_replication_type = "LRS"
  account_kind             = "StorageV2"
  access_tier              = "Hot"

  hns_enabled              = true  # Enable ADLS Gen2
  blob_versioning_enabled  = true
  allow_blob_public_access = false

  containers = [
    {
      name        = "raw"
      access_type = "private"
      metadata    = { env = "dev" }
    },
    {
      name        = "curated"
      access_type = "container"
    }
  ]

  tags = {
    app = "inovocb"
    env = "dev"
  }
}

output "storage_account_name" {
  value = module.storage_account.storage_account_name
}

output "storage_account_id" {
  value = module.storage_account.storage_account_id
}
