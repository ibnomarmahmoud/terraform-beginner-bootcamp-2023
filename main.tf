terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "ExamPro"

  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}
  #cloud {
  #  organization = "Mahmoud"
  #  workspaces {
  #    name = "TerraTown-1"
  #  }
  #}

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token = var.terratowns_access_token
}

module "home_TF_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.TF.public_path
  content_version = var.TF.content_version
}

resource "terratowns_home" "home_mahmoud" {
  name = "Terraform"
  description = <<DESCRIPTION
Terraform is an infrastructure-as-code software tool created by HashiCorp. 
Users define and provide data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL), or optionally JSON.[3]
DESCRIPTION
  domain_name = module.TF.domain_name
  town = "missingo"
  content_version = var.TF.content_version
}

module "Koshery_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.Koshery.public_path
  content_version = var.Koshery.content_version
}

resource "terratowns_home" "home_mahmoud1" {
  name = "Koshery"
  description = <<DESCRIPTION
Koshary, kushari or koshari (Egyptian Arabic: كشرى [ˈkoʃæɾi]) is Egypt's national dish and a widely popular street food.
It is a traditional Egyptian staple, mixing pasta, Egyptian fried rice, vermicelli and brown lentils,and topped with a zesty tomato sauce, 
garlic vinegar and garnished with chickpeas and crispy fried onions. 
It is often served with sprinklings of garlic juice; garlic vinegar and hot sauce are optional.
DESCRIPTION
  domain_name = module.Koshery.domain_name
  town = "cooker-cove"
  content_version = var.Koshary.content_version
}