ecr_repository_name                 = "post-api"
ecr_repository_image_tag_mutability = "MUTABLE"
ecr_repository_lifecycle_policy = [
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

iam_policy_eks_node_names = [
  "AmazonEKSWorkerNodePolicy",
  "AmazonEC2ContainerRegistryReadOnly",
  "AmazonEKS_CNI_Policy"
]

eks_node_role_name        = "BlogPostEKSNodeRole"
eks_node_role_create_role = true

node_group_name            = "blog-post-node-group"
node_group_lt_version      = "$Latest"
node_group_sc_desired_size = 1
node_group_sc_min_size     = 1
node_group_sc_max_size     = 2
node_group_ami_type        = "AL2_x86_64"
node_group_capacity_type   = "ON_DEMAND"
node_group_disk_size       = 20
node_group_instance_types  = ["t3.medium"]

ecr_push_policy_name        = "BlogPostECRPushPolicy"
ecr_push_policy_path        = "/"
ecr_push_policy_description = "Blog Post API ECR에 Push 하기위한 IAM 정책"