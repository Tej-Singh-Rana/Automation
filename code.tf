provider "aws" {
        region = "ap-south-1"

}

resource "aws_instance" "my_instance" {
        ami = "ami-0ce933e2ae91880d3"
        instance_type = "t2.micro"         //Instance //
        count = "5"
	key_name = "terraform_key"
	security_groups = ["Terraform"]
	tags = {
	name = "Terraform-Automation"
}

}



