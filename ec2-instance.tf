resource "aws_instance" "master_node" {
	ami = "ami-08eb150f611ca277f"
	vpc_security_group_ids = [aws_security_group.control_plane.id]
	subnet_id = aws_subnet.subnet_public_ip.id
	instance_type = "t3.medium"
	key_name = "myComputer"

	tags = {
		Name = "master_node"
	}
}

/*
resource "aws_instance" "worker-node" {
	ami = "ami-08eb150f611ca277f"
	vpc_security_group_ids = [aws_security_group.worker_node.id]
	subnet_id = aws_subnet.subnet_public_ip.id
	instance_type = "t3.medium"
	count = 2
	key_name = "myComputer"

	tags = {
		Name = "worker-node"
	}
}
*/