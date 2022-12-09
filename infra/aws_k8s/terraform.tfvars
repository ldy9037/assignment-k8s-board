ecr_board_repository_name = "board-api"
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

eks_board_role_name        = "BoardEKSClusterRole"
eks_board_role_create_role = true

eks_board_node_role_name        = "BoardEKSNodeRole"
eks_board_node_role_create_role = true

eks_board_cluster_name    = "board-cluster"
eks_board_cluster_version = "1.23"

node_group_board_name            = "board-node-group"
node_group_board_lt_version      = "latest_version"
node_group_board_sc_desired_size = 1
node_group_board_sc_min_size     = 1
node_group_board_sc_max_size     = 2

launch_template_board_name          = "board_launch_template"
launch_template_board_image_id      = "ami-0ab04b3ccbadfae1f"
launch_template_board_instance_type = "t3.small"
launch_template_board_ni_public_ip  = false