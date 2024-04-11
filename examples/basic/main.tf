module "this" {
  source = "../../"

  # To get or add the client_id and client_secret, go to https://bitbucket.org/my-workspace/workspace/settings/api
  # and create a new OAuth consumer
  # - "This is a private consumer" should be selected.
  # - Key = client_id, Secret = client_secret
  # - Permissions of repositories read are required.
  client_id     = "foo"
  client_secret = "bar"

  # Either client_id and client_secret or username and password must be provided, if both are provided, OAuth2 will be used.
  # username = "foo"
  # password = "bar"

  # The path to the file in the repository.
  filename = "/path/to/file"

  # The branch, tag, or commit hash to use when retrieving the file.
  ref = "main"

  # The slug of the repository.
  repo_slug = "my-repo"

  # The workspace or team that owns the repository.
  workspace = "my-workspace"
}
