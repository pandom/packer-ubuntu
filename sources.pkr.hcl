source "googlecompute" "base" {
  project_id = var.project_id
  source_image = "ubuntu-minimal-1804-bionic-v20220208"
  region = var.google_region
  ssh_username = "ubuntu"
  zone = var.google_zone
}