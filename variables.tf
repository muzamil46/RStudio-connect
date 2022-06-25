# pass the region as a variable so we can provide it in a tfvars file
variable "region" {
  type = string
  default = "us-west-2"
}

# define the region specific rstudio images
variable "ami" {
    type = string
    default = "ami-08970fb2e5767e3b8"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "zone" {
  type = string
  default = null
}

variable "keypair_name" {
  type = string
}

variable "private_key" {
  type = string
}

variable "disk_size" {
  type    = string
  default = "40"
}

variable "keep_data" {
  type    = string
  default = true
}