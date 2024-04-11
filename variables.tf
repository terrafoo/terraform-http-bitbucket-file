variable "client_id" {
  description = <<-EOT
    The client ID for the OAuth2 application. Either client_id and client_secret or username and password must be
    provided, if both are provided, OAuth2 will be used.
  EOT

  type    = string
  default = null
}

variable "client_secret" {
  description = <<-EOT
    The client secret for the OAuth2 application. Either client_id and client_secret or username and password must be
    provided, if both are provided, OAuth2 will be used.
  EOT

  type    = string
  default = null
}


variable "username" {
  description = <<-EOT
    The username to use for basic authentication. Either client_id and client_secret or username and password must be
    provided, if both are provided, OAuth2 will be used.
  EOT

  type    = string
  default = null
}

variable "password" {
  description = <<-EOT
    The password to use for basic authentication. Either client_id and client_secret or username and password must be
    provided, if both are provided, OAuth2 will be used.
  EOT

  type    = string
  default = null
}

variable "filename" {
  description = <<-EOT
    The filename, including the full path, to the file in the repository.
  EOT

  type = string
}

variable "ref" {
  description = <<-EOT
    The branch, tag, or commit hash to use when retrieving the file.
  EOT

  type    = string
  default = "main"
}

variable "repo_slug" {
  description = <<-EOT
    The slug of the repository.
  EOT

  type = string
}

variable "workspace" {
  description = <<-EOT
    The workspace or team that owns the repository.
  EOT

  type = string
}


