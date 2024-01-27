variable "tf_token" {
    sensitive   = true
    type        = string
    default     = null
}

variable "files" {
    default = [
        "main.tf",
        "output.tf",
        "variables.tf"
    ]
}