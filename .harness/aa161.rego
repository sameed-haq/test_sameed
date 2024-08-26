package main

 

deny[msg] {

input.metadata.roleAssignmentMetadata[0].roleIdentifier == "_account_admin"
input.entity.identifier == "harnessImage"

msg := sprintf("Current user '%s' has cannot update connector", [input.metadata.roleAssignmentMetadata[0].roleIdentifier])
}