terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "~> 1.14"
    }
  }
}

resource "kubectl_manifest" "configmap" {
  yaml_body = templatefile("${path.module}/templates/configmap.tpl", {
    "name" = "my-configmap",
    metadata = {
      "name" = "my-configmap"
      "namespace" = "default"
    },
    data = {
      "error_logs.json" = jsonencode(file("${path.module}/dashboards/error_logs.json")),
      "warn_logs.json" = jsonencode(file("${path.module}/dashboards/warn_logs.json")),
      "info_logs.json" = jsonencode(file("${path.module}/dashboards/info_logs.json"))
    }
  })
}