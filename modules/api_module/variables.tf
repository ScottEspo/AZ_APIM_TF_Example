variable "resource_group_location" {
  type        = string
  default     = "westus"
  description = "Location for all resources."
}

variable "resource_group_name_prefix" {
  type        = string
  default     = "rg"
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "publisher_email" {
  default     = "scott.esposito@daugherty.com"
  description = "The email address of the owner of the service"
  type        = string
  validation {
    condition     = length(var.publisher_email) > 0
    error_message = "The publisher_email must contain at least one character."
  }
}

variable "publisher_name" {
  default     = "publisher"
  description = "The name of the owner of the service"
  type        = string
  validation {
    condition     = length(var.publisher_name) > 0
    error_message = "The publisher_name must contain at least one character."
  }
}

variable "sku" {
  description = "The pricing tier of this API Management service"
  default     = "Developer"
  type        = string
  validation {
    condition     = contains(["Developer", "Standard", "Premium"], var.sku)
    error_message = "The sku must be one of the following: Developer, Standard, Premium."
  }
}

variable "sku_count" {
  description = "The instance size of this API Management service."
  default     = 1
  type        = number
  validation {
    condition     = contains([1, 2], var.sku_count)
    error_message = "The sku_count must be one of the following: 1, 2."
  }
}




variable "api" {
  type = object({

    name        = string
    path        = string
    protocols   = list(string)
    service_url = string
    json        = string
  })

}

variable "create_rg" {
  type    = bool
  default = false
}

variable "rg_name" {
  description = "name of the Resource Group to look up or assign"
  type        = string
}

variable "create_product" {
  type    = bool
  default = false
}

variable "product_name" {
  description = "name of the Product to CREATE"
  type        = string
}

variable "create_apim" {
  type    = bool
  default = false
}

variable "apim_name" {
  description = "name to either lookup or assign"
  type        = string
  default     = null
}