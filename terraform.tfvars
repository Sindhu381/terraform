aws_access_key = "AKIATV3IGZFMK6SZNS7Y"
aws_secret_key = "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"
aws_region = "us-east-1"
vpc_cidr = "10.2.0.0/16"
vpc_name = "terraform-aws-testing"
IGW_name = "terraform-aws-igw"
public_Routing_Table = "Public_table"
private_Routing_Table = "Private_table"
key_name = "aws2key"
environment = "testing"
amis = {
        us-east-1 = "ami-0747bdcabd34c712a" # ubuntu 18.04 LTS
		us-east-2 = "ami-0747bdcabd34c712a" # ubuntu 18.04 LTS
}

azs = ["us-east-1a", "us-east-1b", "us-east-1c"]
instance_type = "t2.nano"

Public_cidrs =["10.2.1.0/24", "10.2.2.0/24", "10.2.3.0/24"]
Private_cidrs =["10.2.10.0/24", "10.2.20.0/24", "10.2.30.0/24"]