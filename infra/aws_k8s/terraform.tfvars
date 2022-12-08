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

board_cluster_s3_policy_name        = "EKSAssumRoleAccess"
board_cluster_s3_policy_path        = "/"
board_cluster_s3_policy_description = "Access other service"

iam_policy_eks_cluster_name = "AmazonEKSClusterPolicy"
eks_board_role_name         = "BoardEKSClusterRole"
eks_board_role_create_role  = true