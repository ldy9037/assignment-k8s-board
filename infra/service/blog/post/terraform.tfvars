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