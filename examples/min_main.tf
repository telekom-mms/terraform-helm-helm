module "helm" {
  source = "git::https://github.com/telekom-mms/terraform-helm-helm"
  helm_release = {
    k8s = {
      chart      = "k8s"
      repository = "https://telekom-mms.github.io/helm-charts/"
    }
  }
}
