variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
}

variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string

}

variable "index_html_filepath" {
  description = "The file path for index.html"
  type        = string

  
}

variable "error_html_filepath" {
  description = "The file path for error.html"
  type        = string

  
}

variable "content_version" {
  type        = number
}

variable "assets_path" {
  description = "Path to assets folder"
  type = string
}

variable "terratowns_endpoint" {
 type = string
}

variable "terratowns_access_token" {
 type = string
}

variable "teacherseat_user_uuid" {
 type = string
}

variable "TF" {
  type = object({
    public_path = string
    content_version = number
  })
}

variable "Koshery" {
  type = object({
    public_path = string
    content_version = number
  })
}