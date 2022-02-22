build {
  hcp_packer_registry {
    bucket_name = "burkey-golden-ubuntu"
    description = <<EOT
Ubuntu 20.04 golden master.
    EOT
    labels = {
      "ubuntu" = "20.04",
      "golden"         = "true",
      "security_hardened" = "true",
      "cis_benchmarked" = "true",
      "github_action" = "true"
    }
  }
  #need
  sources = [
		#"vsphere-iso.ubuntu-1804",
		"amazon-ebs.base",
        "googlecompute.base"
  ]
}