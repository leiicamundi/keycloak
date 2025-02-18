# ! Developer: if you are adding a variable without a default value, please ensure to reference it in the cleanup script (.github/actions/eks-cleanup-resources/scripts/destroy.sh)

variable "region" {
  type        = string
  description = "The region where the cluster and relevant resources should be deployed in"
}

variable "name" {
  type        = string
  description = "Name being used for relevant resources - including EKS cluster name"
}

variable "kubernetes_version" {
  type        = string
  description = "Kubernetes version to be used by EKS"
  # renovate: datasource=endoflife-date depName=amazon-eks versioning=loose
  default = "1.30"
}

variable "np_min_node_count" {
  type        = number
  description = "Minimum number of nodes for the default node pool"
  default     = 1
}

variable "np_max_node_count" {
  type        = number
  description = "Maximum number of nodes for the default node pool"
  default     = 10
}

variable "np_desired_node_count" {
  type        = number
  description = "Actual number of nodes for the default node pool. Min-Max will be used for autoscaling"
  default     = 4
}

variable "np_labels" {
  type        = map(string)
  description = "A map of labels to add to the default pool nodes"
  default     = {}
}

variable "cluster_tags" {
  type        = map(string)
  description = "A map of additional tags to add to the cluster"
  default     = {}
}

variable "np_instance_types" {
  type        = list(string)
  description = "Allow passing a list of instance types for the auto scaler to select from when scaling the default node pool"
  default     = ["m6i.xlarge"]
}

variable "np_disk_size" {
  type        = number
  description = "Disk size of the nodes on the default node pool"
  default     = 20
}

variable "np_ami_type" {
  description = "Amazon Machine Image"
  type        = string
  default     = "AL2_x86_64"
}

variable "np_capacity_type" {
  type        = string
  default     = "ON_DEMAND"
  description = "Allows setting the capacity type to ON_DEMAND or SPOT to determine stable nodes"
}

variable "cluster_service_ipv4_cidr" {
  description = "The CIDR block to assign Kubernetes service IP addresses from. Between /24 and /12."
  type        = string
  default     = "10.190.0.0/16"
}

variable "cluster_node_ipv4_cidr" {
  description = "The CIDR block for public and private subnets of loadbalancers and nodes. Between /28 and /16."
  type        = string
  default     = "10.192.0.0/16"
}

variable "authentication_mode" {
  description = "The authentication mode for the cluster."
  type        = string
  default     = "API" # can also be API_AND_CONFIG_MAP, but will be API only in v21 of aws eks module
}

variable "access_entries" {
  description = "Map of access entries to add to the cluster."
  type        = any
  default     = {}
}
variable "enable_cluster_creator_admin_permissions" {
  description = "Indicates whether or not to add the cluster creator (the identity used by Terraform) as an administrator via access entry."
  type        = bool
  default     = true
}

