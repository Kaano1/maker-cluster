# Master Node

resource "aws_security_group" "control_plane" {
  vpc_id      = "vpc-065771f2a3fc81dda"
  name        = "control_plane_sg"
  description = "Security group for Kubernetes control plane node"

  tags = {
    Name = "control_plane_sg"
  }
}

# Ingress rules for control plane node
resource "aws_security_group_rule" "control_plane_ingress_k8s_api" {
  type                     = "ingress"
  from_port                = 6443
  to_port                  = 6443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.control_plane.id
  cidr_blocks              = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "control_plane_ingress_etcd" {
  type                     = "ingress"
  from_port                = 2379
  to_port                  = 2380
  protocol                 = "tcp"
  security_group_id        = aws_security_group.control_plane.id
  cidr_blocks              = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "control_plane_ingress_kubelet" {
  type                     = "ingress"
  from_port                = 10248
  to_port                  = 10260
  protocol                 = "tcp"
  security_group_id        = aws_security_group.control_plane.id
  cidr_blocks              = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "control_plane_ingress_generic" {
  type                     = "ingress"
  from_port                = 80
  to_port                  = 8080
  protocol                 = "tcp"
  security_group_id        = aws_security_group.control_plane.id
  cidr_blocks              = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "control_plane_ingress_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.control_plane.id
  cidr_blocks              = ["0.0.0.0/0"]
}


resource "aws_security_group_rule" "control_plane_ingress_nodeport" {
  type                     = "ingress"
  from_port                = 30000
  to_port                  = 32767
  protocol                 = "tcp"
  security_group_id        = aws_security_group.control_plane.id
  cidr_blocks              = ["0.0.0.0/0"]
}

# Egress rule for control plane node (allow all outbound)
resource "aws_security_group_rule" "control_plane_egress" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.control_plane.id
  cidr_blocks              = ["0.0.0.0/0"]
}




#--------------------------------------------------------------------------------------
#--------------------------------------------------------------------------------------





# Worker Node

resource "aws_security_group" "worker_node" {
  vpc_id      = "vpc-065771f2a3fc81dda"
  name        = "worker_node_sg"
  description = "Security group for Kubernetes worker plane node"

  tags = {
    Name = "worker_node_sg"
  }
}

# Ingress rules for worker node
resource "aws_security_group_rule" "worker_node_ingress_kubelet" {
  type                     = "ingress"
  from_port                = 10248
  to_port                  = 10260
  protocol                 = "tcp"
  security_group_id        = aws_security_group.worker_node.id
  cidr_blocks              = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "worker_node_ingress_ssh" {
  type                     = "ingress"
  from_port                = 22
  to_port                  = 22
  protocol                 = "tcp"
  security_group_id        = aws_security_group.worker_node.id
  cidr_blocks              = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "worker_node_ingress_nodeport" {
  type                     = "ingress"
  from_port                = 30000
  to_port                  = 32767
  protocol                 = "tcp"
  security_group_id        = aws_security_group.worker_node.id
  cidr_blocks              = ["0.0.0.0/0"]
}

# Egress rule for worker node (allow all outbound)
resource "aws_security_group_rule" "worker_node_egress" {
  type                     = "egress"
  from_port                = 0
  to_port                  = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.worker_node.id
  cidr_blocks              = ["0.0.0.0/0"]
}
