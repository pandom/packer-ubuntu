build {
  hcp_packer_registry {
    bucket_name = "burkey-golden-ubuntu"
    description = <<EOT
Ubuntu 20.04 golden master.
    EOT
    bucket_labels = {
      "ubuntu" = "20.04-2022",
      "golden"         = "true",
      "security_hardened" = "true",
      "cis_benchmarked" = "true",
      "github_action" = "true",
    }
    build_labels = {
        "log4j" = "resolved"
        "ciphers" = "2022-approved"
        "python-version"   = "3.9",
        "ubuntu-version" = "20.04.03"
        "build-time" = timestamp()
}
  }
  
  #need
  sources = [
		#"vsphere-iso.ubuntu-1804",
		"amazon-ebs.base"#,
    #"googlecompute.base"
  ]

  provisioner "ansible" {
    playbook_file = "./playbook.yaml"
    user = "ubuntu"
    extra_arguments = [
			"--extra-vars",
			"vault_addr=${var.vault_addr} ansible_user_password=${var.ansible_user_password}"
		]
  }
}