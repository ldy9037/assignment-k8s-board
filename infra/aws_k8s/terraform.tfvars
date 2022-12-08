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
eks_board_role_name         = "BoardEKSClusterRole"
eks_board_role_create_role  = true