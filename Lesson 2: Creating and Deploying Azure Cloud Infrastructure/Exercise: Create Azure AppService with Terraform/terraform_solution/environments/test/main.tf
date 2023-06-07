provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "csb10030000a3a1445e"
    container_name       = "mycontainer"
    key                  = ""
    access_key           = "q8gdcDz6V6XpbAPWfGYn0GuZi/JBHVKmDP/RmN70Td7nd9YGv3eXt/NEDdgRlTE5jn2J4hYdOsP2+ASt48j1jQ=="
  }
}
locals {
  tags = {
    tier        = "${var.tier}"
    deployment  = "${var.deployment}"
  }
}
module "resource_group" {
  source               = "../../modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}
module "appservice" {
  source           = "../../modules/appservice"
  location         = "${var.location}"
  application_type = "${var.application_type}"
  resource_type    = "AppService"
  resource_group   = "${module.resource_group.resource_group_name}"
  tags             = "${local.tags}"
}
