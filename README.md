# packer-ubuntu

This repository is a working example of using a GitHub Action to build ubuntu images for AWS and Google Cloud. The outcome is consistent and hardened images for Ubuntu 20.04 on GCP and AWS.


It uses JWT Authentication to take the trusted, encoded values from the GitHub Actions platform and uses them to authenticate to HashiCorp Cloud Platform Vault. Vault generates and retrieves credentials for HCP Packer, AWS, and GCP.

Ansible is used with submodule cloning to personify specific images. These roles align to the CIS benchmark and lock down the ubuntu images.
## Topology

```mermaid
flowchart TD
subgraph Vault
c1[HCP Vault]
r-- read -->c2[AWS Dynamic Cred]
r-- read -->c4[GCP Dynamic Cred]
r-- read -->c5[HashiCorp Cloud Cred]
j(jwt role)
c1-- role defines secret access -->r(vault role)
end

subgraph GHA [Github Actions]
a1[Action Pipeline]-->a2[Retrieve Secret Step]

a2-- after getting dynamic secrets -->a3
subgraph packer[ ]
a3[Build Packer Image]-- uses dynamic secrets-->a
a3-- uses dynamic secrets-->g
a[aws builder]
g[gce builder]
end
end
a2 -- JWT Authentication ---> j
j-- grants access to-->c1
r ------- | exports rolebound secrets |a2
subgraph hcp[HCP Packer]
hcpapi[API]
subgraph b1[UbuntuBucket]
i1[Iteration 1]
i2[Iteration 2]
iN[Iteration N]
end
end
packer-.-hcpapi
hcpapi-->i1
hcpapi-->i2
hcpapi-->iN
```