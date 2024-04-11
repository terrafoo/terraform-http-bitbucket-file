locals {
  is_oauth = (var.client_id != null && var.client_secret != null) ? true : false

  auth_header = (
    local.is_oauth ?
    format("Bearer %s", jsondecode(data.http.bitbucket_oauth[0].response_body).access_token) :
    format("Basic %s", base64encode("${var.username}:${var.password}"))
  )
}

data "http" "bitbucket_oauth" {
  count = local.is_oauth ? 1 : 0

  url    = "https://bitbucket.org/site/oauth2/access_token"
  method = "POST"

  request_headers = {
    Content-Type  = "application/x-www-form-urlencoded"
    Authorization = format("Basic %s", base64encode("${var.client_id}:${var.client_secret}"))
  }

  request_body = "grant_type=client_credentials"

  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Status code invalid"
    }
  }
}

data "http" "this" {
  url = "https://api.bitbucket.org/2.0/repositories/${var.workspace}/${var.repo_slug}/src/${var.ref}/${var.filename}"

  # Optional request headers
  request_headers = {
    Authorization = local.auth_header
  }

  lifecycle {
    postcondition {
      condition     = contains([200], self.status_code)
      error_message = "Status code invalid"
    }
  }
}
