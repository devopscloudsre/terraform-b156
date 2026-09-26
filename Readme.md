# Terraform examples

This repository contains two independent Terraform examples. Run each example from its own directory.

## Examples

- [File creation example](file-creation-example/Readme.md): uses the local provider to create and manage a text file without cloud resources.
- [AWS VPC example](aws-vpc-example/Readme.md): creates one VPC with two public subnets, two private subnets, one NAT gateway, one internet gateway, and separate public and private route tables.

## Install Terraform

Install Terraform before using either example. Follow HashiCorp's [official installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli), then verify the CLI:

```powershell
terraform version
```

The file creation example is local-only. The AWS VPC example requires AWS credentials and can incur charges, especially from the NAT gateway. Destroy AWS resources when finished.
