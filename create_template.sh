# this file is used to create a folder structure for a new terraform project

echo "Creating folder structure for new terraform project"

# select for aws or azure
echo "Select the cloud provider: "
echo "1. AWS"
echo "2. Azure"
read cloud_provider

# if aws then cd into aws folder else cd into azure folder
if [ $cloud_provider == 1 ]
then
    cd aws
else
    cd azure
fi

echo "Enter the name of the project: "
read project_name

echo "Creating folder structure for $project_name"
mkdir $project_name

# create the folder structure
echo "Opening $project_name folder"
echo "Creating folder structure for $project_name"
cd $project_name

echo "Creating backend.tf file"
touch backend.tf

echo "Creating provider.tf file"
touch provider.tf

echo "Creating main.tf file"
touch main.tf

echo "Creating variables.tf file"
touch variables.tf

echo "Creating outputs.tf file"
touch outputs.tf

echo "Creating jsons folder"
mkdir jsons

echo "Creating terraform.tfvars file"
touch terraform.tfvars

echo "DONE!"
echo "Folder structure for $project_name created"



