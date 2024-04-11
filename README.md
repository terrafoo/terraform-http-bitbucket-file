# Terraform Bitbucket file

This module is used to get the contents of a file from a Bitbucket repository. The Bitbucket API is used to get the file contents via the terraform http provider.

Both oauth and basic authentication are supported.

## oAuth Consumer
To get or add the client_id and client_secret, go to https://bitbucket.org/my-workspace/workspace/settings/api

Createing a new OAuth consumer
- "This is a private consumer" should be selected
- Key = var.client_id, Secret = var.client_secret
- Permissions of repositories read are required

# Usage

Get contents of a file from a Bitbucket repository using basic authentication:
```hcl
module "bitbucket_file" {
  source  = "jksmth/bitbucket-file/http"
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
  source  = "jksmth/bitbucket-file/http"
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
  source  = "jksmth/bitbucket-file/http"
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

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | 3.4.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [http_http.bitbucket_oauth](https://registry.terraform.io/providers/hashicorp/http/3.4.2/docs/data-sources/http) | data source |
| [http_http.this](https://registry.terraform.io/providers/hashicorp/http/3.4.2/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_client_id"></a> [client\_id](#input\_client\_id) | The client ID for the OAuth2 application. Either client\_id and client\_secret or username and password must be<br>provided, if both are provided, OAuth2 will be used. | `string` | `null` | no |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The client secret for the OAuth2 application. Either client\_id and client\_secret or username and password must be<br>provided, if both are provided, OAuth2 will be used. | `string` | `null` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | The filename, including the full path, to the file in the repository. | `string` | n/a | yes |
| <a name="input_password"></a> [password](#input\_password) | The password to use for basic authentication. Either client\_id and client\_secret or username and password must be<br>provided, if both are provided, OAuth2 will be used. | `string` | `null` | no |
| <a name="input_ref"></a> [ref](#input\_ref) | The branch, tag, or commit hash to use when retrieving the file. | `string` | `"main"` | no |
| <a name="input_repo_slug"></a> [repo\_slug](#input\_repo\_slug) | The slug of the repository. | `string` | n/a | yes |
| <a name="input_username"></a> [username](#input\_username) | The username to use for basic authentication. Either client\_id and client\_secret or username and password must be<br>provided, if both are provided, OAuth2 will be used. | `string` | `null` | no |
| <a name="input_workspace"></a> [workspace](#input\_workspace) | The workspace or team that owns the repository. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_content"></a> [content](#output\_content) | The content of the file at the specified path in the specified repository. |
| <a name="output_content_base64"></a> [content\_base64](#output\_content\_base64) | The content of the file at the specified path in the specified repository, base64 encoded. |
| <a name="output_id"></a> [id](#output\_id) | The ID, which is the full URL of the file at the specified path in the specified repository. |
| <a name="output_response_headers"></a> [response\_headers](#output\_response\_headers) | The headers of the HTTP response. |
| <a name="output_status"></a> [status](#output\_status) | The status code of the HTTP response. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
