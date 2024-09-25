terraform {
  required_providers {
    harness = {
      source = "harness/harness"
      version = "0.32.3"
    }
  }
}



resource "harness_platform_policy" "test" {
       description    = "test1123"
       identifier     = "afffing"
       name           = "afffing"
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
