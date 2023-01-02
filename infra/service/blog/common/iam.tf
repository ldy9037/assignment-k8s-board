# EKS Role
data "aws_iam_policy" "iam_policy_eks_cluster" {
  name = var.iam_policy_eks_cluster_name
}

data "aws_iam_policy_document" "iam_policy_document_eks_cluster" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["eks.amazonaws.com"]
    }

    effect = "Allow"
  }
}

module "eks_cluster_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.9.1"

  create_role = var.eks_cluster_role_create_role

  role_name = var.eks_cluster_role_name

  custom_role_trust_policy = data.aws_iam_policy_document.iam_policy_document_eks_cluster.json
  custom_role_policy_arns = [
    data.aws_iam_policy.iam_policy_eks_cluster.arn
  ]
}
