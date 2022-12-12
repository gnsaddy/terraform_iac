# Terraform AWS EC2 Example

This example shows how to use the [terraform-aws-ec2](https://www.terraform.io/docs/providers/aws/r/instance.html) module to create an EC2 instance.

## Quick start

1. Follow the [root README](../../README.md) to setup your AWS credentials.
2. Change to this directory (`cd aws\ec2-example`). This is where the Terraform code is located for this example.
3. Run `terraform init`. This will download the required modules.
4. Run `terraform fmt`. This will format the Terraform code.
5. Run `terraform validate`. This will validate the Terraform code.
6. Run `terraform plan -out=plan.out`. This will create a plan. The `-out` flag will save the plan to a file. This is useful if you want to run `terraform apply` later.
7. Run `terraform apply plan.out`. This will apply the plan. The `plan.out` file is the output from the previous step. You can also run `terraform apply` without the plan file, but this will prompt you for confirmation.
8. Run `terraform destroy`. This will destroy the EC2 instance.

## Notes

* The `terraform fmt` command is not required, but is useful for standardizing files and keeping diffs clean when collaborating on Terraform code. It is recommended that you run this command before committing any changes to version control.
* The `terraform validate` command is not required, but is useful for checking whether the configuration is syntactically valid and internally consistent, regardless of any provided variables or existing state. It is recommended that you run this command before committing any changes to version control.

## Files description

* `backend.tf` - The backend configuration file. This is where you configure the backend for storing the Terraform state.
* `provider.tf` - The provider configuration file. This is where you configure the AWS provider.
* `main.tf` - The main Terraform file. This is where you define the resources to create.
* `variables.tf` - The variables file. This is where you define any variables that the module accepts.
* `outputs.tf` - The outputs file. This is where you define any outputs from this module.
* `terraform.tfvars` - The Terraform variables file. This is where you define the values for the variables.
* `plan.out` - The Terraform plan file. This is created by the `terraform plan` command. It is useful if you want to run `terraform apply` later.

## Resources created

* `aws_instance` - The EC2 instance.
* `aws_security_group` - The security group for the EC2 instance.
* `aws_key_pair` - The SSH key pair for the EC2 instance.

