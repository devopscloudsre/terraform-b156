# Learn Terraform step by step

This small, safe example uses Terraform's **local provider** to create a text file on your computer. It does not create cloud resources or incur cloud costs. Terraform still downloads the provider plugin during initialization.

## Install Terraform

Install Terraform before starting this example. Follow HashiCorp's [official installation guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) for Windows, macOS, or Linux.

On Windows, if you have [Chocolatey](https://chocolatey.org/) installed, you can install Terraform from PowerShell:

```powershell
choco install terraform
```

After installation, open a new terminal and verify that Terraform is available:

```powershell
terraform version
```

## Prerequisites

- Terraform CLI 1.5 or newer installed and available on your `PATH`.
- A terminal opened in this `terraform` directory.
- Internet access for the first `terraform init` (to download the local provider).

Check your installation:

```powershell
terraform version
```

## Files in this example

- `versions.tf` declares the required Terraform and provider versions.
- `variables.tf` defines configurable inputs.
- `main.tf` configures the provider and declares a file resource.
- `outputs.tf` displays useful values after applying.

The [AWS VPC example](../aws-vpc-example/Readme.md) is kept in a separate directory. It has two public subnets, two private subnets, one NAT gateway, one internet gateway, and separate public and private route tables. It requires AWS credentials and can incur AWS charges.

## Step-by-step

### 1. Read the configuration

Terraform configuration is declarative: describe the desired result and Terraform determines the actions to reach it.

- `terraform` blocks specify tool and provider requirements.
- `provider` blocks configure a provider, which lets Terraform interact with a platform or service.
- `resource` blocks describe infrastructure to create or manage.
- `variable` blocks make configuration reusable.
- `output` blocks expose values after an apply.

### 2. Initialize the working directory

```powershell
terraform init
```

This downloads the required provider and creates `.terraform/` plus a dependency lock file. Keep the lock file in version control; do not commit `.terraform/`.

### 3. Format and validate

```powershell
terraform fmt
terraform validate
```

`fmt` formats the configuration. `validate` checks its syntax and internal consistency.

### 4. Preview the change

```powershell
terraform plan
```

Review the plan. It should show one `local_file` resource to be created. Planning does not create the file.

### 5. Apply the change

```powershell
terraform apply
```

Review the plan and type `yes` when prompted. Terraform creates `hello.txt` in this directory and prints the outputs.

To customize the message without changing the configuration:

```powershell
terraform apply -var="message=Terraform is managing this file."
```

To choose a different filename:

```powershell
terraform apply -var="output_file=welcome.txt"
```

The last apply's values are reflected in Terraform state. The example intentionally keeps the generated file in this directory so its lifecycle is easy to inspect.

### 6. Inspect the result and state

```powershell
terraform output
terraform state list
```

Terraform state records the resources it manages and their attributes. Treat state files as potentially sensitive: do not commit `terraform.tfstate` or its backup.

### 7. Change the desired configuration

Edit the `message` default in `variables.tf`, then run `terraform plan` and `terraform apply` again. Terraform compares the configuration and state, then updates the file to match the new desired content.

### 8. Clean up

```powershell
terraform destroy
```

Review the proposed deletion and type `yes`. This removes the Terraform-managed file and state-tracked resource. It does not uninstall Terraform or remove the provider cache.

## Useful commands

```powershell
terraform fmt -check
terraform validate
terraform plan -out=tfplan
terraform apply tfplan
```

Use a saved plan only when you intend to apply that exact reviewed plan. Remove it after use; plan files can contain sensitive values. For this beginner example, `terraform plan` followed by `terraform apply` is sufficient.

## Important notes

- Run Terraform commands from this directory so they use the intended configuration and state.
- Do not manually edit Terraform state files.
- `terraform destroy` removes managed objects; only run it when you intend to clean up.
- This example is local-only. Real cloud examples need provider credentials, cost review, and cloud-specific cleanup.
