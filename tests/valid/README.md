# Terraform valid test

This test serves as a minimal root module to call the project module for the purpose of running a `terraform validate`.

## Background

Since all of Terraform's commands assume that they are dealing with root modules, `terraform validate` is not intended to be ran directly on a called module. This can lead to unexpected behaviour in some cases, such as when provider configuration is required.

Terraform modules written using Terraform 0.15+ which use provider `configuration_aliases` ([Provider Aliases Within Modules](https://www.terraform.io/language/modules/develop/providers#provider-aliases-within-modules)), will error on `terraform validate` when ran directly on the child module due to missing the provider block.

Older versions of terraform could treat the empty provider block as a "proxy" for a provider passed in, but there was no way to differentiate that from an actual provider declared within in the module in all cases. It was a confusing syntax overloading the meaning of the provider block causing it to change behaviour based on the context of the parent module. This behaviour was deprecated and removed before 1.0.

For more details, see terraform github issue [#28490](https://github.com/hashicorp/terraform/issues/28490)

A number of solutions were investigated to workaround this limitation of the `validate` command. The suggestions documented on (pre-commit-terraform)[https://github.com/antonbabenko/pre-commit-terraform#terraform_validate] do not easily cover all use-cases or require additional tooling to generate a dummy provider block.

This solution was inspired by a (suggestion)[https://github.com/hashicorp/terraform/issues/28490#issuecomment-1045008605] from a terraform developer to follow a similar strategy used by the module testing experiment.

## Test files

The terraform files provided in this test are intended to be a generic root module that should work for most basic use-cases. An example is provided below to support provider aliases

## Provider alias example

`File: main.tf`
```
terraform {
  required_version = "~> 1.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.14"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "aws" {
  region = var.region
  alias  = "foo"
}

module "this" {
  source = "../../"

  providers = {
    aws     = aws
    aws.foo = aws.foo
  }
}
```

`File: variables.tf`
```
variable "region" {
  default     = "eu-west-2"
  type        = string
  description = "AWS region for provider"
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

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
