vpc_name                     = "k8s-board-vpc"
vpc_cidr                     = "192.168.0.0/24"
database_subnets             = ["192.168.0.0/27", "192.168.0.32/27"]
private_subnets              = ["192.168.0.64/27", "192.168.0.96/27"]
public_subnets               = ["192.168.0.128/27", "192.168.0.160/27"]
create_database_subnet_group = true
enable_nat_gateway           = true

sg_developer_ssh_name        = "developer_to_ssh_sg"
sg_developer_ssh_description = "Allows developers to access ssh"
sg_developer_ssh_ingress_with_cidr_blocks = [
  {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    description = "ldy9037"
    cidr_blocks = "14.57.183.238/32"
  }
]

sg_developer_was_name        = "developer_to_was_sg"
sg_developer_was_description = "Allows developers to access was"
sg_developer_was_ingress_with_cidr_blocks = [
  {
    from_port   = 8080
    to_port     = 8090
    protocol    = "tcp"
    description = "ldy9037"
    cidr_blocks = "14.57.183.238/32"
  }
]

sg_all_egress_with_cidr_blocks = [
  {
    rule = "all-all"
  }
]