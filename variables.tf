# variables.tf

variable "toSandbox" {
  description = "Flag to determine if the environment is sandbox"
  type        = bool
}

variable "policy_directories" {
  description = "Directories to search for .rego files"
  type        = list(string)
  default     = ["Monitoring", "SCM", "CV", "CT", "CI", "CD", "IAC"]
}
