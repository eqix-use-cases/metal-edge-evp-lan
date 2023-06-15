// network edge
variable "notification_email" {
  type    = list(any)
  default = []
}

variable "route_os" {
  type    = string
  default = ""
}

variable "route_os_version" {
  type    = string
  default = ""
}

variable "package_code" {
  type    = string
  default = ""
}

variable "core_count" {
  type    = number
  default = 0
}

variable "term_length" {
  type    = number
  default = 0
}

variable "dc1_code" {
  type    = string
  default = ""
}

variable "dc2_code" {
  type    = string
  default = ""
}

variable "account_name" {
  type    = string
  default = ""
}

// metal
variable "project_id" {
  type    = string
  default = ""
}

variable "metro" {
  type    = string
  default = ""
}

variable "plan" {
  type    = string
  default = ""
}

variable "os" {
  type    = string
  default = ""
}

// metal l2
variable "vxlan" {
  type    = number
  default = 0
}

variable "vxlan_net" {
  type    = string
  default = ""
}

variable "vxlan_mask" {
  type    = string
  default = ""
}

// metal vc
variable "connection_id" {
  type    = string
  default = ""
}

// fabric connections
variable "connection_type" {
  type    = string
  default = ""
}

variable "notifications_type" {
  type    = string
  default = ""
}

variable "notifications_emails" {
  type    = list(any)
  default = []
}

variable "bandwidth" {
  type    = string
  default = ""
}
