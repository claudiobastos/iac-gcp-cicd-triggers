# Informações necessárias para a esteira de construção de um projeto específico
variable "gcp_credentials" {
  description = "Conta de serviço com permissões necessárias para o terraform funcionar"
  default     = "gcp-terraform.json"
}

variable "project_id" {
  description = "Nome do projeto do GCP"
  default     = ""
  type        = string
}

variable "git_provider_id" {
  default     = ""
  description = "value"
  type        = string
}

variable "git_repo_id" {
  default     = ""
  description = "value"
  type        = string
}

variable "git_repo_branch" {
  default     = "development"
  description = "branch default para acionamento do trigger"
  type        = string
}

variable "system_slug" {
  description = "Slug do projeto/serviço/sistema na sua plataforma"
  default     = "my-project"
  type        = string
}

variable "k8s_cluster_name" {
  default     = "my-cluster"
  description = "K8s: Nome do cluster Kubernetes"
}

variable "k8s_cluster_zone" {
  default     = "southamerica-east1-a"
  description = "K8s: Zona do cluster Kubernetes"
}

