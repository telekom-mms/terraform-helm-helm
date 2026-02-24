variable "helm_release" {
  type        = any
  default     = {}
  description = "Resource definition, default settings are defined within locals and merged with var settings. For more information look at [Outputs](#Outputs)."
}

locals {
  default = {
    // resource definition
    helm_release = {
      name                       = ""
      repository                 = null
      values                     = null
      namespace                  = null
      timeout                    = null
      create_namespace           = null
      version                    = null
      verify                     = null
      keyring                    = null
      disable_webhooks           = null
      reuse_values               = null
      reset_values               = null
      force_update               = null
      recreate_pods              = null
      cleanup_on_fail            = null
      max_history                = null
      atomic                     = null
      skip_crds                  = null
      render_subchart_notes      = null
      disable_openapi_validation = null
      wait                       = null
      wait_for_jobs              = null
      dependency_update          = null
      replace                    = null
      description                = null
      lint                       = null
      repository_key_file        = null
      repository_cert_file       = null
      repository_ca_file         = null
      repository_username        = null
      repository_password        = null
      devel                      = null
      set                        = {}
      set_sensitive              = {}
      // postrender is complex, merging handled in post-processing if needed
      postrender = null
    }
  }

  // compare and merge custom and default values
  helm_release_values = {
    for helm_release in keys(var.helm_release) :
    helm_release => merge(local.default.helm_release, var.helm_release[helm_release])
  }

  // merge all custom and default values for complex nested structures
  helm_release = {
    for helm_release in keys(var.helm_release) :
    helm_release => merge(
      local.helm_release_values[helm_release],
      {
        for config in ["set", "set_sensitive"] :
        config => merge(local.default.helm_release[config], try(var.helm_release[helm_release][config], {}))
      }
    )
  }
}
