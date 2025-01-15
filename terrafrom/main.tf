variable "oci_helm_url" {
  description = "URL of the OCI Helm repository"
  type        = string
}

variable "delegate_selectors" {
  description = "Delegate selectors for the Helm connector"
  type        = list(string)
}

variable "oci_helm_credentials" {
  description = "OCI Helm credentials (optional)"
  type = object({
    username     = string
    password_ref = string
  })
  default = null
}

resource "harness_platform_connector_oci_helm" "oci_helm_connector" {
  identifier  = "OIC_HELM_BF"
  name        = "OIC_HELM_BF"
  description = "OIC_HELM_BF"
  tags        = ["foo:bear"]

  url                = var.oci_helm_url
  delegate_selectors = var.delegate_selectors

  dynamic "credentials" {
    for_each = var.oci_helm_credentials != null ? [1] : []
    content {
      username     = var.oci_helm_credentials["username"]
      password_ref = var.oci_helm_credentials["password_ref"]
    }
  }
}

