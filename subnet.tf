resource "aws_subnet" "subnet_public_ip" {
  vpc_id                  = "vpc-065771f2a3fc81dda"
  cidr_block              = "20.0.0.0/16"
  map_public_ip_on_launch = true
  availability_zone       = "eu-north-1a"

  tags = {
    Name = "subnet_public_ip"
  }
}
