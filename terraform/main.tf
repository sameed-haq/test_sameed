terraform {
  required_providers {
    harness = {
      source = "harness/harness"
      version = "0.32.3"
    }
  }
}
provider "harness" {
  endpoint         = "https://qa.harness.io/gateway"
  account_id       = "Ws0xvw71Sm2YmpSC7A8z4g"
  platform_api_key = "pat.Ws0xvw71Sm2YmpSC7A8z4g.66a71532fc4a487bcbcbecb6.Q3NobVGcy0OkNQ2pa6Pq"
}


resource "harness_platform_policy" "test" {
       description    = "test1123"
       identifier     = "a111testing"
       name           = "a111testing"
       rego           = <<-EOT
            package pipeline
            
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


