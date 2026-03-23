output "release" {
  description = "Outputs all attributes of helm_release."
  value = {
    for release in keys(helm_release.release) :
    release => {
      for key, value in helm_release.release[release] :
      key => value
    }
  }
}

output "variables" {
  description = "Displays all configurable variables passed by the module. __default__ = predefined values per module. __merged__ = result of merging the default values and custom values passed to the module"
  value = {
    default = {
      for variable in keys(local.default) :
      variable => local.default[variable]
    }
    merged = {
      release = {
        for key in keys(var.release) :
        key => local.release[key]
      }
    }
  }
}
