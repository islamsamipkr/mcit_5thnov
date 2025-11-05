# =================================================================
# General environment and Azure settings
# =================================================================
variable "resource_group_name" {
  description = "Name of the existing Resource Group where the storage account will be created."
  type        = string
}

variable "location" {
  description = "Azure region for the resources (e.g. canadacentral, eastus2)."
  type        = string
  default     = "canadacentral"
}

# =================================================================
# Storage Account naming configuration
# =================================================================
variable "name_prefix" {
  description = "Prefix for the Storage Account name (only lowercase letters and digits)."
  type        = string
}

variable "name_suffix" {
  description = "Optional suffix appended to the storage account name."
  type        = string
  default     = ""
}

variable "generate_random_suffix" {
  description = "Append random characters to ensure global uniqueness."
  type        = bool
  default     = true
}

# =================================================================
# Storage Account settings
# =================================================================
variable "account_tier" {
  description = "Account tier: Standard or Premium."
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Replication type: LRS, ZRS, GRS, RAGRS, GZRS, RAGZRS."
  type        = string
  default     = "LRS"
}

variable "account_kind" {
  description = "Storage account kind: StorageV2, Storage, BlobStorage, etc."
  type        = string
  default     = "StorageV2"
}

variable "access_tier" {
  description = "Access tier for hot or cool data. Only for StorageV2."
  type        = string
  default     = "Hot"
}

variable "hns_enabled" {
  description = "Enable hierarchical namespace for ADLS Gen2."
  type        = bool
  default     = false
}

variable "blob_versioning_enabled" {
  description = "Enable blob versioning."
  type        = bool
  default     = false
}

variable "allow_blob_public_access" {
  description = "Allow public access to blob containers."
  type        = bool
  default     = false
}

# =================================================================
# Container creation
# =================================================================
variable "containers" {
  description = <<EOT
List of blob containers to create within the storage account.
Each element should have:
{
  name        = "containername"
  access_type = "private" | "blob" | "container"
  metadata    = optional map of tags
}
EOT
  type = list(object({
    name        = string
    access_type = string
    metadata    = optional(map(string))
  }))
  default = []
}

# =================================================================
# Tagging
# =================================================================
variable "tags" {
  description = "Tags to assign to all resources."
  type        = map(string)
  default     = {}
}
