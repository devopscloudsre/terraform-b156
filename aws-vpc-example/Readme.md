# AWS VPC example

This example creates an AWS VPC with:

- Two public subnets in two availability zones.
- Two private subnets in two availability zones.
- One internet gateway attached to the VPC.
- One NAT gateway in the first public subnet.
- Two route tables: one public route table and one private route table.

The public route table sends internet traffic to the internet gateway. The private route table sends internet traffic to the NAT gateway, allowing resources in the private subnets to make outbound connections without receiving public IP addresses.

## Prerequisites

- Terraform CLI 1.5 or newer.
- An AWS account and credentials configured for the AWS provider. See the [AWS provider authentication documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication-and-configuration).
- Permissions to create VPC, subnet, route table, Elastic IP, internet gateway, and NAT gateway resources.

## Create the VPC

Run these commands from this directory:

```powershell
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```

Review the plan and type `yes` when prompted. To use a different region:

```powershell
terraform apply -var="aws_region=us-west-2"
```

You can also provide two explicit availability zones:

```powershell
terraform apply -var='availability_zones=["us-west-2a","us-west-2b"]'
```

Inspect the IDs after applying:

```powershell
terraform output
```

## Clean up

NAT gateways and Elastic IPs can incur AWS charges. Destroy the example when you are finished:

```powershell
terraform destroy
```

Review the proposed deletions and type `yes` when prompted.
