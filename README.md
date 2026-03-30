# terraform-helm-helm

This module manages helm releases.

## Usage

```hcl
module "helm" {
  source = "registry.terraform.io/telekom-mms/helm/helm"
  helm_release = {
    helm = {
      chart      = "helm"
      repository = "https://charts.helm.sh/stable"
    }
  }
}
```
