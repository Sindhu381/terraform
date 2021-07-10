resource "aws_subnet" "public-subnets" {
    count = "${length(var.Public_cidrs)}"
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${element(var.Public_cidrs, count.index)}"
    availability_zone = "us-east-1a"

    tags = {
        Name = "Public-subnet-${count.index+1}"
    }
}

resource "aws_subnet" "private-subnets" {
    count = "${length(var.Private_cidrs)}"
    vpc_id = "${aws_vpc.default.id}"
    cidr_block = "${element(var.Private_cidrs, count.index)}"
    availability_zone = "${element(var.azs, count.index)}"

    tags = {
         Name = "Private-subnet-${count.index+1}"
    }
}