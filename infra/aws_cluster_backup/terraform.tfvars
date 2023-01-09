ecr_board_repository_name                 = "post-api"
ecr_board_repository_image_tag_mutability = "MUTABLE"
ecr_board_repository_lifecycle_policy = [
  {
    rulePriority = 1,
    description  = "Keep last 10 images",
    selection = {
      tagStatus     = "tagged",
      tagPrefixList = ["v"],
      countType     = "imageCountMoreThan",
      countNumber   = 10
    },
    action = {
      type = "expire"
    }
  }
]

iam_policy_eks_cluster_name = "AmazonEKSClusterPolicy"
iam_policy_eks_node_names = [
  "AmazonEKSWorkerNodePolicy",
  "AmazonEC2ContainerRegistryReadOnly",
  "AmazonEKS_CNI_Policy"
]

eks_connector_agent_policy_name        = "AmazonEKSConnectorAgentPolicy"
eks_connector_agent_policy_path        = "/"
eks_connector_agent_policy_description = ""

eks_connector_agent_role_name        = "AmazonEKSConnectorAgentRole"
eks_connector_agent_role_create_role = true

eks_alb_controller_policy_name        = "AmazonALBControllerPolicy"
eks_alb_controller_policy_path        = "/"
eks_alb_controller_policy_description = ""

eks_board_role_name        = "BoardEKSClusterRole"
eks_board_role_create_role = true

eks_board_node_role_name        = "BoardEKSNodeRole"
eks_board_node_role_create_role = true

eks_alb_controller_role_name        = "AmazonEKSALBControllerRole"
eks_alb_controller_role_create_role = true

eks_board_cluster_name    = "board-cluster"
eks_board_cluster_version = "1.23"
eks_board_cluster_oicd_id = "DD2934CE233BD10BE04D32E1F2DC9E01"

node_group_board_name            = "board-node-group"
node_group_board_lt_version      = "$Latest"
node_group_board_sc_desired_size = 1
node_group_board_sc_min_size     = 1
node_group_board_sc_max_size     = 2
node_group_board_ami_type        = "AL2_x86_64"
node_group_board_capacity_type   = "ON_DEMAND"
node_group_board_disk_size       = 20
node_group_board_instance_types  = ["t3.medium"]