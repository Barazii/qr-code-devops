output "cluster_endpoint" {
  description = "Endpoint for the EKS cluster"
  value       = aws_eks_cluster.my_cluster.endpoint
}

output "cluster_name" {
  description = "Name of the EKS cluster"
  value       = aws_eks_cluster.my_cluster.name
}

output "kubeconfig" {
  description = "Kubeconfig to connect to the cluster"
  sensitive = true
  value       = <<EOT
apiVersion: v1
clusters:
- cluster:
    server: ${aws_eks_cluster.my_cluster.endpoint}
    certificate-authority-data: ${aws_eks_cluster.my_cluster.certificate_authority[0].data}
  name: ${aws_eks_cluster.my_cluster.name}
contexts:
- context:
    cluster: ${aws_eks_cluster.my_cluster.name}
    user: ${aws_eks_cluster.my_cluster.name}
  name: ${aws_eks_cluster.my_cluster.name}
current-context: ${aws_eks_cluster.my_cluster.name}
kind: Config
preferences: {}
users:
- name: ${aws_eks_cluster.my_cluster.name}
  user:
    exec:
        apiVersion: client.authentication.k8s.io/v1beta1
        command: aws
        args:
          - eks
          - get-token
          - --cluster-name
          - my-eks-cluster
          - --region
          - eu-north-1
    # token: ${data.aws_eks_cluster_auth.my_cluster.token}
EOT
}