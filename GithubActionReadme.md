<!-- Github action for terraform CI/CD -->

# Terraform CI/CD using Github Actions

## Description

GitHub Actions is a powerful tool that allows you to automate your workflow, including your Terraform CI/CD process. With GitHub Actions, you can create custom actions that integrate with your Terraform code, allowing you to run Terraform commands and manage infrastructure as code. Here is an example of a simple workflow that you could use to set up Terraform CI/CD with GitHub Actions:

1. Create a new GitHub repository to store your Terraform code.
2. In your repository, create a new file named main.tf and add your Terraform configuration code to this file
3. In the same directory, create a file named .github/workflows/terraform.yml and add the following code to this file:

    ```yaml

    name: Terraform CI/CD

    on:
        push:
            branches: [ master ]
        pull_request:
            branches: [ master ]

    jobs:
    terraform:
        runs-on: ubuntu-latest
        steps:
        - uses: actions/checkout@v2
        - name: Install Terraform
            uses: hashicorp/terraform-github-actions@v1
            with:
            version: 0.14.4
            terraform-working-directory: /path/to/terraform/code
        - name: Init and Plan
            run: |
            terraform init
            terraform plan
        - name: Apply
            run: terraform apply
            -auto-approve
        - name: Destroy
            run: terraform destroy
            -auto-approve
    ```

4. Commit and push the changes to the master branch of your repository.

In this example, the pipeline will be triggered whenever a push is made to the master branch or a new pull request is opened against the master branch. The pipeline will then run a series of steps to build and deploy your Terraform code.

The first step is to use the actions/checkout action to check out your code from GitHub. Then, the hashicorp/setup-terraform action is used to install the specified version of Terraform. Next, the terraform init command is run to initialize the Terraform working directory, followed by the terraform plan command to create an execution plan. Finally, the terraform apply -auto-approve command is run to apply the changes to your infrastructure.

Of course, this is just one example of a Terraform CI/CD pipeline using GitHub Actions. You can customize the steps and the triggers to fit your specific needs. For more information on GitHub Actions and how to use them with Terraform, please see the GitHub Actions documentation.
