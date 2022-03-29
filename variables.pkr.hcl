variable "project_id" {
  type = string
  default = "hc-ce255594f61a4d4d87cbb1efb50"
}

variable "google_region" {
  type = string
  default = "australia-southeast2"
}

variable "google_zone" {
  type = string
  default = "australia-southeast2-a"
}
variable "prefix" {
	type = string
	default = "base"
}

variable "region" {
    type = string
    default = "ap-southeast-2"
}
variable "owner" {
    type = string
    default = "Burkey"
}

variable "vault_addr" {
    type = string
    default = "http://vault:8200"
}

variable "ansible_user_password" {
    type = string
    default = "ansible"
}