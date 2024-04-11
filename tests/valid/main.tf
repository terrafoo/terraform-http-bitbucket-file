terraform {
  required_version = ">= 1.6"

  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.4.2"
    }
  }
}

module "this" {
  source = "../../"

  client_id     = "foo"
  client_secret = "bar"

  filename  = "/path/to/file"
  ref       = "main"
  repo_slug = "my-repo"
  workspace = "my-workspace"
}
