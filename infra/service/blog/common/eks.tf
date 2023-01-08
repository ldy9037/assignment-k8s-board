resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster_name
  version  = var.eks_cluster_version
  role_arn = module.eks_cluster_role.iam_role_arn

  vpc_config {
    subnet_ids = data.tfe_outputs.network_output.values.private_subnets
  }

  depends_on = [
    module.eks_cluster_role
  ]
}