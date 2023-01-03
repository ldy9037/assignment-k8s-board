data "aws_iam_policy" "iam_policy_eks_node" {
  count = length(var.iam_policy_eks_node_names)
  name  = var.iam_policy_eks_node_names[count.index]
}

data "aws_iam_policy_document" "eks_node_role_trust_policy" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    effect = "Allow"
  }
}

module "eks_node_role" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-assumable-role"
  version = "5.9.1"

  create_role = var.eks_node_role_create_role

  role_name = var.eks_node_role_name

  custom_role_trust_policy = data.aws_iam_policy_document.eks_node_role_trust_policy.json
  custom_role_policy_arns  = [for eks_node_policy in data.aws_iam_policy.iam_policy_eks_node : eks_node_policy.arn]
}