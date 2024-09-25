terraform {
  required_providers {
    harness = {
      source = "harness/harness"
      version = "0.32.3"
    }
  }
}

provider "harness" {
  endpoint         = var.harness_endpoint
  account_id       = var.harness_account_id
  platform_api_key = var.harness_platform_api_key
}

variable "harness_endpoint" {
  description = "The Harness API endpoint"
  type        = string
  sensitive   = false  
}

variable "harness_account_id" {
  description = "Harness account ID"
  type        = string
  sensitive   = false 
}

variable "harness_platform_api_key" {
  description = "Harness API key"
  type        = string
  sensitive   = true 
}

resource "harness_platform_policy" "test" {
       description    = "test1123"
       identifier     = "a2111testing"
       name           = "a2111testing"
       rego           = <<-EOT
            package pipeline#testingg
            
            # Deny pipelines that don't have an approval step
            # NOTE: Try removing the HarnessApproval step from your input to see the policy fail
            deny[msg] {
                # Find all stages that are Deployments ...
                input.pipeline.stages[i].stage.type == "Approval"
            
                # ... that are not in the set of stages with HarnessApproval steps
                not stages_with_approval[i]
            
                # Show a human-friendly error message
                msg := sprintf("Approval stage '%s' does not have a HarnessApproval step", [input.pipeline.stages[i].stage.name])
            }
            
            # Find the set of stages that contain a HarnessApproval step
            stages_with_approval[i] {
                input.pipeline.stages[i].stage.spec.execution.steps[_].step.type == "HarnessApproval"
            }
        EOT
    }
