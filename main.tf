/**
* # helm
*
* This module manages the hashicorp/helm release resources.
* For more information see https://registry.terraform.io/providers/hashicorp/helm/latest/docs > release
*
*/

resource "helm_release" "release" {
  for_each = var.release

  name                       = local.release[each.key].name == "" ? each.key : local.release[each.key].name
  chart                      = local.release[each.key].chart
  repository                 = local.release[each.key].repository
  values                     = local.release[each.key].values
  namespace                  = local.release[each.key].namespace
  version                    = local.release[each.key].version
  verify                     = local.release[each.key].verify
  keyring                    = local.release[each.key].keyring
  timeout                    = local.release[each.key].timeout
  disable_webhooks           = local.release[each.key].disable_webhooks
  reuse_values               = local.release[each.key].reuse_values
  reset_values               = local.release[each.key].reset_values
  force_update               = local.release[each.key].force_update
  recreate_pods              = local.release[each.key].recreate_pods
  cleanup_on_fail            = local.release[each.key].cleanup_on_fail
  max_history                = local.release[each.key].max_history
  atomic                     = local.release[each.key].atomic
  skip_crds                  = local.release[each.key].skip_crds
  render_subchart_notes      = local.release[each.key].render_subchart_notes
  disable_openapi_validation = local.release[each.key].disable_openapi_validation
  wait                       = local.release[each.key].wait
  wait_for_jobs              = local.release[each.key].wait_for_jobs
  dependency_update          = local.release[each.key].dependency_update
  replace                    = local.release[each.key].replace
  description                = local.release[each.key].description
  lint                       = local.release[each.key].lint
  create_namespace           = local.release[each.key].create_namespace
  repository_key_file        = local.release[each.key].repository_key_file
  repository_cert_file       = local.release[each.key].repository_cert_file
  repository_ca_file         = local.release[each.key].repository_ca_file
  repository_username        = local.release[each.key].repository_username
  repository_password        = local.release[each.key].repository_password
  devel                      = local.release[each.key].devel
  set                        = local.release[each.key].set
  set_sensitive              = local.release[each.key].set_sensitive
  postrender                 = local.release[each.key].postrender
}
