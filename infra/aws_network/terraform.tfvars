vpc_name                     = "k8s-board-vpc"
vpc_cidr                     = "192.168.0.0/24"
database_subnets             = ["192.168.0.0/27", "192.168.0.32/27"]
private_subnets              = ["192.168.0.64/27", "192.168.0.96/27"]
public_subnets               = ["192.168.0.128/27", "192.168.0.160/27"]
create_database_subnet_group = true
enable_nat_gateway           = true