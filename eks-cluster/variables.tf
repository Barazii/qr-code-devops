variable "aws_region" {
  description = "AWS region to deploy the EKS cluster"
  default     = "eu-north-1"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  default     = "my-eks-cluster"
}

variable "node_instance_type" {
  description = "Instance type for EKS worker nodes"
  default     = "t3.medium"
}