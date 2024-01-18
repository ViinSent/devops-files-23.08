variable "svc_name" {
    description = "The name of the service"
    type        = string
    default     = null
}

variable "svc_labels" {
    description = "The labels of the service"
    type        = map(string)
    default     = null
}

variable "svc_namespace" {
    description = "The namespace of the service"
    type        = string
    default     = "default"
}

variable "svc_selector" {
    description = "The selector of the service"
    type        = map(string)
    default     = null
}

variable "svc_port" {
    description = "The port of the service"
    type        = number
    default     = 80
}

variable "svc_target_port" {
    description = "The target port of the service"
    type        = number
    default     = 80
}

variable "svc_type" {
    description = "The type of the service"
    type        = string
    default     = "ClusterIP"
}
