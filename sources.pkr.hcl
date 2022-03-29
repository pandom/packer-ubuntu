# Time stamps for image file placed into Cloud
locals {
	timestamp = regex_replace(timestamp(), "[- TZ:]", "")
}

source "googlecompute" "base" {
  project_id = var.project_id
  source_image = "ubuntu-minimal-2004-focal-v20220118"
  region = var.google_region
  ssh_username = "ubuntu"
  zone = var.google_zone
}

source "amazon-ebs" "base" {
  region = var.region

  source_ami_filter {
    filters = {
       virtualization-type = "hvm"
       name = "ubuntu/images/*ubuntu-focal-20.04-amd64-server-*"
       root-device-type = "ebs"
    }
    owners = ["099720109477"] # Canonical
    most_recent = true
  }

  instance_type = "t2.medium"
  ssh_username = "ubuntu"
  ami_name = "${var.prefix}-${local.timestamp}"

  tags = {
    owner = var.owner
    delete_date = "2022-04-08"
    application = "base-build"
    golden    = "false"
    security_hardened = "true"
    cis_benchmarked = "true"
    github_action = "true"
  }
}