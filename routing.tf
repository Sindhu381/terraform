resource "aws_route_table" "public" {
    vpc_id = "${aws_vpc.default.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.default.id}"
    }
    tags = {
        Name = "${var.public_Routing_Table}"
    }
}

resource "aws_route_table" "private" {
    vpc_id = "${aws_vpc.default.id}"
    tags = {
        Name = "${var.private_Routing_Table}"
    }
}


resource "aws_route_table_association" "public" {
    count = "${length(var.Public_cidrs)}"
   subnet_id = "${element(aws_subnet.public-subnets.*.id,count.index)}"
    route_table_id = "${aws_route_table.public.id}"
}

resource "aws_route_table_association" "private" {
    count = "${length(var.Private_cidrs)}"
    subnet_id = "${element(aws_subnet.private-subnets.*.id,count.index)}"
    route_table_id = "${aws_route_table.private.id}"
}