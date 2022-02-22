build {
#   hcp_packer_registry {
#     bucket_name = "burkey-golden-ubuntu"
#     description = <<EOT
# Ubuntu 18.04 golden master.
#     EOT
#     labels = {
#       "ubuntu" = "18.04",
#       "golden"         = "true",
#       "security_hardened" = "true",
#       "cis_benchmarked" = "true"
#     }
#   }
  #need
  sources = [
		#"vsphere-iso.ubuntu-1804",
		# "amazon-ebs.base",
        "googlecompute.base"
  ]
}