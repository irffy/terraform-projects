variable "instances" {
  type = map(object({
    ami           = string
    instance_type = string
  }))
  default = {
    "web1" = { ami = "ami-0013610ea966aafe0", instance_type = "t2.micro" }
    "web2" = { ami = "ami-0e3faa5e960844571", instance_type = "t2.micro" }
  }
}
