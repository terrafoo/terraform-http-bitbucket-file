# Basic example

Example terraform root module to demonstrate the basic usage of the module

# Usage

Get contents of a file from a Bitbucket repository using basic authentication:
```hcl
module "bitbucket_file" {
  source  = "terrafoo/bitbucket-file/http"
  version = "~>1.0.0"

  username = "my-username"
  password = "my-password"

  filename  = "/foo/bar/baz.txt"
  repo_slug = "my-repo"
  workspace = "my-workspace"
}
```

Get contents of a file from a Bitbucket repository using oauth authentication:
```hcl
module "bitbucket_file" {
  source  = "terrafoo/bitbucket-file/http"
  version = "~>1.0"

  client_id     = "my-client-id"
  client_secret = "my-client-secret"

  filename  = "/foo/bar/baz.txt"
  repo_slug = "my-repo"
  workspace = "my-workspace"
}
```

Get contents of file from a Bitbucket repository from a specific tag:
```hcl
module "bitbucket_file" {
  source  = "terrafoo/bitbucket-file/http"
  version = "~>1.0"

  username = "my-username"
  password = "my-password"

  filename  = "/foo/bar/baz.txt"
  repo_slug = "my-repo"
  workspace = "my-workspace"
  ref       = "v1.0.0"
}
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6 |
| <a name="requirement_http"></a> [http](#requirement\_http) | 3.4.2 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | ../../ | n/a |

## Resources

No resources.

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_this"></a> [this](#output\_this) | The output of the module. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
