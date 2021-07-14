resource "aws_instance" "public-servers" {
    count= 1 #"${var.environment == "PROD" ? 3 : 1}"
    #the above systax tells if prod create 3 or else 1
    ami = "${lookup(var.amis,var.aws_region)}"
    availability_zone = "us-east-1a"
    instance_type = var.instance_type 
    key_name = var.key_name
    subnet_id = "${element(aws_subnet.public-subnets.*.id,count.index)}"
    vpc_security_group_ids = ["${aws_security_group.Allow_all.id}"]
    associate_public_ip_address = true	
    tags = {
      Name = " Public-Server-${count.index+1}"
      Env = "Prod"
      Owner = "Sree"
 	  CostCenter = "ABCD"
    }

   }




