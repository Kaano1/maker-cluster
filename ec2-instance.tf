variable "worker_count" {
  description = "The number of Worker Node to create"
  type        = number
  default     = 2
}

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


resource "aws_instance" "worker_node" {
	ami = "ami-08eb150f611ca277f"
	vpc_security_group_ids = [aws_security_group.worker_node.id]
	subnet_id = aws_subnet.subnet_public_ip.id
	instance_type = "t3.medium"
	count = var.worker_count
	key_name = "myComputer"

	tags = {
		Name = "worker_node"
	}
}
