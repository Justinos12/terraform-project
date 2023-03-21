variable "region" {
  type = string
  default = "us-east-1"
}

variable "bucket_name" {
  type = string
  default = "bootcamp-30-koffi"
}

variable "acl" {
  type = string
  default = "private"
}

variable "versioning" {
  type = string
  default = "Enabled"
}