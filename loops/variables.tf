variable "ami_id" {
  type        = string
  description = "ami_id OS"
  default     = "ami-0220d79f3f480ecf5"
}

variable "instance_type" {
  default     = "t3.micro"
}

variable "tags" {
    type = map(string)
    default = {
    Name = "Running"
  }
}

variable "sg_name" {
 type = string
 default = "allow_tls"
}

variable "cidr_blocks" {
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "environment" {
  default     = "dev"
}

variable "instance" {
  default = ["mongodb", "redis", "mysql", "rabbitmq"]
}