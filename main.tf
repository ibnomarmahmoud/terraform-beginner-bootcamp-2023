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
  #  organization = "ExamPro"
  #  workspaces {
  #    name = "terra-house-1"
  #  }
  #}

}

provider "terratowns" {
  endpoint = "https://terratowns.cloud/api"
  user_uuid="47a922c1-3dd0-4147-999f-d8d24e4a78e6" 
  token="45755add-2b01-4cbd-8fd0-029d2c372631"
}

module "terrahouse_aws" {
  source = "./modules/terrahouse_aws"
  user_uuid = var.user_uuid
  bucket_name = var.bucket_name
  index_html_filepath = var.index_html_filepath
  error_html_filepath = var.error_html_filepath
  content_version = var.content_version
  assets_path = var.assets_path
}

resource "terratowns_home" "home_mahmoud1" {
  name = "Egyptain Tasty Koshery"
  description = <<DESCRIPTION
Koshary, kushari or koshari (Egyptian Arabic: كشرى [ˈkoʃæɾi]) is Egypt's national dish 
and a widely popular street food.
It is a traditional Egyptian staple, mixing pasta, Egyptian fried rice, vermicelli and brown lentils,
and topped with a zesty tomato sauce, garlic vinegar and garnished with chickpeas and crispy fried onions.
It is often served with sprinklings of garlic juice; garlic vinegar and hot sauce are optional.
DESCRIPTION
  domain_name = module.terrahouse_aws.cloudfront_url
  #domain_name = "3fdq3gz1.cloudfront.net"
  town = "cooker-cove"
  content_version = 1
}