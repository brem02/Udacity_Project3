provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "storage235285"
    container_name       = "mycontainer"
    key                  = "Gfp3m5z7LPpoYuYBBk4nHPyhB2tfD3WBCjjPycsx7Iv1WIXGO9miVV8mao9GZ9fGMhXu2Z7Bs7UA+AStevkd+g=="
    access_key           = "Gfp3m5z7LPpoYuYBBk4nHPyhB2tfD3WBCjjPycsx7Iv1WIXGO9miVV8mao9GZ9fGMhXu2Z7Bs7UA+AStevkd+g=="
  }
}
module "resource_group" {
  #source               = "../../modules/resource_group"
  source               = "./modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}

  # Reference the AppService Module here.
  module "appservice" {
  #source           = "../../modules/appservice"
  source           = "./modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "AppService"
  resource_group   = "${module.resource_group.resource_group_name}"
  #tags             = "${local.tags}"
}
