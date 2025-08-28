variable "oci_helm_url" {
  description = "URL of the OCI Helm repository"
  type        = string
}
variable "oic_user" {
  description = "URL of the OCI Helm repository"
  type        = string
}
variable "oic_pass" {
  description = "URL of the OCI Helm repository"
  type        = string
}

variable "delegate_selectors" {
  description = "Delegate selectors for the Helm connector"
  type        = list(string)
}

resource "harness_platform_connector_oci_helm" "oci_helm_connector" {
  identifier  = "OIC_HELM_BF"
  name        = "OIC_HELM_BF"
  description = "OIC_HELM_BF"
  tags        = ["foo:bear"]

  url                = var.oci_helm_url
  delegate_selectors = var.delegate_selectors

  credentials {
    username     = var.oic_user
    password_ref = var.oic_pass
  }
}

