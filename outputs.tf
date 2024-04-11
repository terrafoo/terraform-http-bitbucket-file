output "id" {
  description = <<-EOT
    The ID, which is the full URL of the file at the specified path in the specified repository.
  EOT

  value = data.http.this.id
}

output "content" {
  description = <<-EOT
    The content of the file at the specified path in the specified repository.
  EOT

  value = data.http.this.response_body
}

output "content_base64" {
  description = <<-EOT
    The content of the file at the specified path in the specified repository, base64 encoded.
  EOT

  value = data.http.this.response_body_base64
}

output "status" {
  description = <<-EOT
    The status code of the HTTP response.
  EOT

  value = data.http.this.status_code
}

output "response_headers" {
  description = <<-EOT
    The headers of the HTTP response.
  EOT

  value = data.http.this.response_headers
}
