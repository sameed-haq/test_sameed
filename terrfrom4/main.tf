terraform {
  required_providers {
    harness = {
      source = "harness/harness"
      version = "0.32.3"
    }
  }
}


resource "harness_platform_policyset" "test" {
  identifier = "testTTf"
  name       = "testf"
  action     = "onrun"
  type       = "pipeline"
  enabled    = true
  policies {
    identifier = "afffing2"
    severity   = "warning"
  }
}
