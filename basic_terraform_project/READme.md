Remember to export credentials for this project.

We will refactor the project so we will create two modules, one for ACR and another for resource group.

Then we will use a registry module (public module) to create two virtual networks in our security groups in northeurope and westeurope locations.

This way we will be able to interact with both handcrafted modules and registry modules, other projects will be able to re-use our modules if required.

replace placeholder names for resources like rg names, ACR names and virtual network names with your own names.

Things to consider:


we will need to run terraform init multiple times to install dependencies
and providers.

we will need to run terraform init -upgrade in case the dependencies need to catch up

we will need to run terraform validate a lot to check the pitfalls.


What we are going to create specifically:

we are going to create: two resources groups, northeurope, westeurope.
(using for each)

id → fully qualified Azure resource ID

name → the RG name Terraform generated

location → the Azure regions

These RGs are the backbone for everything else.

2 azure container registries in each region

Login server → hostname to push/pull Docker images.

Admin username/password → credentials to authenticate with ACR (password is marked sensitive).

1:1 mapping with your Resource Groups.

Deploy 1 VNet per region , using registry module.


What You Now Have in Summary:

Reusable, multi-region infra workflow:

Local modules → Resource Groups + ACR

Registry module → VNets

Fully parameterized:

Change locations → Terraform deploys RG + ACR + VNet in each region automatically.

Outputs for login info and resource IDs → ready for automation (like CI/CD pipelines, Terraform outputs feeding scripts, etc).


these are the current values of the workflow. Please change them to your own using different Azure Names:

Summary — Resource Names in Azure (No Workspace)
resource : name
	RG	letsgo
   ACR	tacrmyacr
  VNetwork	vnet
Subnets	web-subnet, db-subnet

Don't change names in modules as names in there work locally within modules.