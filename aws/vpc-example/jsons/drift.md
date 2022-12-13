# Generating report
# Description:
```info
'-' Something has been changed outside of Terraform.
'+' Something has been changed in Terraform.
'~' Something has been changed in both Terraform and outside of Terraform.
```
## Drifts detected
```txt

Note: Objects have changed outside of Terraform

Terraform detected the following changes made outside of Terraform since the
last "terraform apply" which may have affected this plan:

  # aws_subnet.public_subnet[1] has been deleted
- resource "aws_subnet" "public_subnet" {
    - arn                                            = "arn:aws:ec2:us-east-2:923411774909:subnet/subnet-0426dd21c86e2300c" -> null
    - assign_ipv6_address_on_creation                = false -> null
    - availability_zone                              = "us-east-2b" -> null
    - availability_zone_id                           = "use2-az2" -> null
    - cidr_block                                     = "10.0.2.0/24" -> null
    - enable_dns64                                   = false -> null
    - enable_resource_name_dns_a_record_on_launch    = false -> null
    - enable_resource_name_dns_aaaa_record_on_launch = false -> null
    - id                                             = "subnet-0426dd21c86e2300c" -> null
    - ipv6_native                                    = false -> null
    - map_customer_owned_ip_on_launch                = false -> null
    - map_public_ip_on_launch                        = true -> null
    - owner_id                                       = "923411774909" -> null
    - private_dns_hostname_type_on_launch            = "ip-name" -> null
    - tags                                           = {
        - "Name" = "public-subnet-1"
        } -> null
    - tags_all                                       = {
        - "Name" = "public-subnet-1"
        } -> null
    - vpc_id                                         = "vpc-0d45ab750dc3a464e" -> null
    }


Unless you have made equivalent changes to your configuration, or ignored the
relevant attributes using ignore_changes, the following plan may include
actions to undo or respond to these changes.

─────────────────────────────────────────────────────────────────────────────

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
+ create

Terraform will perform the following actions:

  # aws_route_table_association.public_route_table_association[1] will be created
+ resource "aws_route_table_association" "public_route_table_association" {
    + id             = (known after apply)
    + route_table_id = "rtb-03d1e75e58d05ff61"
    + subnet_id      = (known after apply)
    }

  # aws_subnet.public_subnet[1] will be created
+ resource "aws_subnet" "public_subnet" {
    + arn                                            = (known after apply)
    + assign_ipv6_address_on_creation                = false
    + availability_zone                              = "us-east-2b"
    + availability_zone_id                           = (known after apply)
    + cidr_block                                     = "10.0.2.0/24"
    + enable_dns64                                   = false
    + enable_resource_name_dns_a_record_on_launch    = false
    + enable_resource_name_dns_aaaa_record_on_launch = false
    + id                                             = (known after apply)
    + ipv6_cidr_block_association_id                 = (known after apply)
    + ipv6_native                                    = false
    + map_public_ip_on_launch                        = true
    + owner_id                                       = (known after apply)
    + private_dns_hostname_type_on_launch            = (known after apply)
    + tags                                           = {
        + "Name" = "public-subnet-1"
        }
    + tags_all                                       = {
        + "Name" = "public-subnet-1"
        }
    + vpc_id                                         = "vpc-0d45ab750dc3a464e"
    }

Plan: 2 to add, 0 to change, 0 to destroy.

Changes to Outputs:
~  public_subnet_availability_zone_id = [
        "use2-az1",
    - "use2-az2",
    + (known after apply),
        "use2-az3",
    ]
~  public_subnet_id                   = [
        "subnet-0ca3372c0de2f1926",
    - "subnet-0426dd21c86e2300c",
    + (known after apply),
        "subnet-0ba71163407ff2b71",
    ]
```
## Summary
```json
{
  "create": 2,
  "update": 0,
  "delete": 0
}
```
