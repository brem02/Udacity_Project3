provider "azurerm" {
  tenant_id       = "${var.tenant_id}"
  subscription_id = "${var.subscription_id}"
  client_id       = "${var.client_id}"
  client_secret   = "${var.client_secret}"
  features {}
}
terraform {
  backend "azurerm" {
    storage_account_name = "storage235262"
    container_name       = "mycontainer"
    key                  = "MJJvSXQrPHriJZyq5n6hZPppMSgGjhP6Zhd0EYtIvC84A/zMZF3Z1dnhKN6vz24/o6tXY08jv7L8+AStQhaZcw=="
    access_key           = "MJJvSXQrPHriJZyq5n6hZPppMSgGjhP6Zhd0EYtIvC84A/zMZF3Z1dnhKN6vz24/o6tXY08jv7L8+AStQhaZcw=="
  }
}
module "resource_group" {
  #source               = "../../modules/resource_group"
  source               = "/modules/resource_group"
  resource_group       = "${var.resource_group}"
  location             = "${var.location}"
}
# Reference the AppService Module here.
