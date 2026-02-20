module "helm" {
  source = "git::https://github.com/telekom-mms/terraform-helm-helm"
  helm_release = {
    k8s-release = {
      chart                      = "k8s"
      repository                 = "https://telekom-mms.github.io/helm-charts/"
      version                    = "1.0.0"
      name                       = "my-k8s-release"
      namespace                  = "example"
      create_namespace           = true
      timeout                    = 600
      description                = "Full example deployment of k8s chart"
      wait                       = true
      atomic                     = true
      cleanup_on_fail            = true
      max_history                = 5
      lint                       = true
      verify                     = false
      keyring                    = "/.gnupg/pubring.gpg"
      disable_webhooks           = false
      reuse_values               = false
      reset_values               = true
      force_update               = true
      recreate_pods              = true
      skip_crds                  = false
      render_subchart_notes      = true
      disable_openapi_validation = false
      wait_for_jobs              = true
      dependency_update          = true
      replace                    = true
      devel                      = false
      set = {
        example_set = {
          name  = "some.value"
          value = "true"
          type  = "string"
        }
      }
      set_sensitive = {
        example_sensitive = {
          name  = "some.sensitive.value"
          value = "sensitive"
          type  = "string"
        }
      }
    }
  }
}
