<!-- Readme file for Infrastructure management with Terraform -->
<!-- Code for AWS and Azure cloud -->

# Infrastructure management with Terraform

## This repository contains code for AWS and Azure cloud.

- [Infrastructure management with Terraform](#infrastructure-management-with-terraform)
  - [This repository contains code for AWS and Azure cloud.](#this-repository-contains-code-for-aws-and-azure-cloud)
  - [AWS](#aws)
    - [Prerequisites for AWS](#prerequisites-for-aws)
    - [Steps for configuration of AWS CLI](#steps-for-configuration-of-aws-cli)
    - [Steps for configuration of Terraform for AWS](#steps-for-configuration-of-terraform-for-aws)
  - [Azure](#azure)
    - [Prerequisites for Azure](#prerequisites-for-azure)
    - [Steps for configuration of Azure CLI](#steps-for-configuration-of-azure-cli)
    - [Steps for configuration of Terraform for Azure](#steps-for-configuration-of-terraform-for-azure)
  - [Other useful commands](#other-useful-commands)
  - [References](#references)
  - [Author](#author)
  - [License](#license)
  - [How to contribute](#how-to-contribute)

## AWS

---

### Prerequisites for AWS

- AWS account
- AWS CLI
- Terraform
- IAM user with programmatic access
- AWS credentials and region

### Steps for configuration of AWS CLI

1. Create a new IAM user with programmatic access and attach the following policies to the user:
    1. AmazonEC2FullAccess
    2. AmazonS3FullAccess (For S3 bucket creation)
2. Generate the access key and secret key for the user and save it in a secure location.
3. Configure the AWS CLI with the access key and secret key.
4. Create a new S3 bucket and enable versioning. S3 bucket can be used to store the terraform state file.
5. Backup the terraform state file in the S3 bucket.

    1. Create a new file named `backend.tf` and add the following code:

        ```terraform
        terraform {
            backend "s3" {
                bucket = "s3-bucket-name"
                key    = "s3-bucket-key"
                region = "s3-bucket-region"
            }
        }
        ```

    2. This will create a new file named `terraform.tfstate` in the S3 bucket. This file will be used to store the terraform state file.

### Steps for configuration of Terraform for AWS

1. Create a new file named `terraform.tfvars` and add the following variables:
    1. `aws_access_key` - AWS access key
    2. `aws_secret_key` - AWS secret key
    3. `aws_region` - AWS region
    4. `s3_bucket_name` - S3 bucket name
    5. `s3_bucket_key` - S3 bucket key
    6. `s3_bucket_region` - S3 bucket region
2. Run the following commands:
    1. `terraform init` - To initialize the working directory
    2. `terraform refresh` - To update the state file against real resources
    3. `terraform fmt` - To rewrite Terraform configuration files to a canonical format and style
    4. `terraform validate` - To validate the configuration files
    5. `terraform plan` - To create an execution plan
    6. `terraform apply` - To apply the changes required to reach the desired state of the configuration
    7. `terraform destroy` - To destroy the Terraform-managed infrastructure

## Azure

### Prerequisites for Azure

- Azure account
- Azure CLI
- Terraform
- Azure credentials and region
- Azure subscription ID
- Azure tenant ID
- Azure client ID
- Azure client secret

### Steps for configuration of Azure CLI

1. Create a new service principal with the following command:

    ```bash
    az ad sp create-for-rbac --name "terraform" --role="Contributor" --scopes="/subscriptions/<subscription_id>"
    ```

2. Copy the `appId`, `password`, `tenant` and save it in a secure location.
3. Configure the Azure CLI with the `appId`, `password`, `tenant` and `subscriptionId`.
4. Create a new resource group and storage account. Storage account can be used to store the terraform state file.
5. Backup the terraform state file in the storage account.

    1. Create a new file named `backend.tf` and add the following code:

        ```terraform
        terraform {
            backend "azurerm" {
                resource_group_name  = "resource-group-name"
                storage_account_name = "storage-account-name"
                container_name       = "container-name"
                key                  = "storage-account-key"
            }
        }
        ```

    2. This will create a new file named `terraform.tfstate` in the storage account. This file will be used to store the terraform state file.
    3. Enable versioning for the storage account.

### Steps for configuration of Terraform for Azure

1. Create a new file named `terraform.tfvars` and add the following variables:
    1. `azure_subscription_id` - Azure subscription ID
    2. `azure_tenant_id` - Azure tenant ID
    3. `azure_client_id` - Azure client ID
    4. `azure_client_secret` - Azure client secret
    5. `azure_region` - Azure region
    6. `storage_account_name` - Storage account name
    7. `storage_account_key` - Storage account key
    8. `resource_group_name` - Resource group name
    9. `container_name` - Container name
2. Run the following commands:
    1. `terraform init` - To initialize the working directory
    2. `terraform refresh` - To update the state file against real resources
    3. `terraform fmt` - To rewrite Terraform configuration files to a canonical format and style
    4. `terraform validate` - To validate the configuration files
    5. `terraform plan` - To create an execution plan
    6. `terraform apply` - To apply the changes required to reach the desired state of the configuration
    7. `terraform destroy` - To destroy the Terraform-managed infrastructure

## Other useful commands

1. `terraform show` - To show the current state of the infrastructure
2. `terraform import` - To import existing infrastructure into Terraform
3. `terraform output` - To show the output values from the root module
4. `terraform console` - To open an interactive console for Terraform interpolations
5. `terraform graph` - To create a visual graph of Terraform resources

## References

1. [Terraform](https://www.terraform.io/)
2. [Terraform - Getting Started](https://learn.hashicorp.com/terraform/getting-started/install.html)
3. [Terraform - AWS Provider](https://www.terraform.io/docs/providers/aws/index.html)
4. [Terraform - Azure Provider](https://www.terraform.io/docs/providers/azurerm/index.html)
5. [Terraform - Azure CLI](https://docs.microsoft.com/en-us/cli/azure/?view=azure-cli-latest)
6. [Terraform - Azure CLI - Create Service Principal](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest)
7. [Terraform - Azure CLI - Configure](https://docs.microsoft.com/en-us/cli/azure/azure-cli-configuration?view=azure-cli-latest)
8. [Terraform - AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html)
9. [Terraform - AWS CLI - Configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
10. [Youtube- Terraform Tutorial for Beginners](<https://www.youtube.com/watch?v=V4waklkBC38>) by [FreeCodeCamp.org](https://www.youtube.com/channel/UC8butISFwT-Wl7EV0hUK0BQ) on YouTube (Video)
11. [YouTube - Terraform AWS](https://www.youtube.com/watch?v=SLB_c_ayRMo) by [freeCodeCamp.org](https://www.youtube.com/channel/UC8butISFwT-Wl7EV0hUK0BQ) on YouTube (Video)
12. [YouTube - Terraform Azure Playlist](https://www.youtube.com/playlist?list=PLm0VCJgNxnpcurgTRPgG9uKRuP9zM2b30) by [Bee a Learner](<https://www.youtube.com/@azurecloud.learn-withme>) on YouTube (Video)
    
## Author

[Aditya Raj](https://www.linkedin.com/in/gnsaddy/)[![LinkedIn](https://img.shields.io/badge/LinkedIn-Aditya%20Raj-blue)](https://www.linkedin.com/in/gnsaddy/)

## License

[MIT](https://choosealicense.com/licenses/mit/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## How to contribute

- Fork the repository
- Clone the forked repository to your local machine
- Create a new branch using git checkout -b <branch-name>
- Make changes to the code
- Commit the changes using git commit -m "<commit-message>"
- Push the changes to your forked repository using git push origin <branch-name>
- Create a pull request
- Wait for your pull request to be reviewed and merged
- Star this repository
- Celebrate - you've just contributed to open source!



