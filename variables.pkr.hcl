variable "project_id" {
  type = string
  default = "hc-2f9e4edd6f864e6a82c45a6dd79"
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