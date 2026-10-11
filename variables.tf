variable "cloudfunctions_function_iam_members" {
  description = <<EOT
Map of cloudfunctions_function_iam_members, attributes below
Required:
    - cloud_function
    - member
    - role
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    cloud_function = string
    member         = string
    role           = string
    project        = optional(string)
    region         = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}

