# Data Sources in Terraform

Data sources allow us to query or retrieve data from remote APIs or from other Terraform projects.

Let's say that we have an external project which is not managed by us, but it is deploying some existing VPC and some existing role that we would like to make use of in our project.
In our Terraform configuration, we don't really want to recreate this VPC and don't want to start managing this VPC from within our project because this VPC is already existing because this VPC is managed by another team. Also, the EC2 instance and the RDS resource want to make use of these  resources - the existing VPC and the existing role. If we were to fully take it over by importing it into our Terraform configuration, we would actually have to start managing it ourselves.

This is one of the very common use cases for data sources.

We can define a data block or a data source in our Terraform configuration, and we can then use this data source to fetch information, or to fetch an object that will represent this existing VPC.

Terraform will then reach out to the Remote Providers API to find the existing VPC according to the filters that we define in the data source, and we will then be able to reference the information from this existing VPC, and then use this information within our RDS resource, as well as within our EC2 resource, without really having to manage this resource, this existing VPC. The same thing is valid for the existing role.

Terraform not only provides us a way of defining our own infrastructure objects, our own infrastructure resources via the resource blocks, but also to use information that is managed by other teams, by other projects and externally from our project and from our configuration to reference this information within our own Terraform project.

### Useful Resources

-   AWS AMI Data Source - [https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)