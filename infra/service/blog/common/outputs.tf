output "eks_cluster_name" {
  description = "Blog Cluster 명"
  value       = aws_eks_cluster.eks_cluster.id
}