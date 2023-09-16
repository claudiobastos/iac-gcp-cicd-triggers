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
  default     = "main"
  description = "branch default para acionamento do trigger"
  type        = string
}


variable "artifact_repo_id" {
  default     = ""
  description = "Nome do repositório de artefatos"
}

variable "artifact_region" {
  default     = ""
  description = "Região do repositório de artefatos"
}

variable "asset_bucket" {
  default     = ""
  description = "Bucket que armazena assets relativos aos projetos"
}

variable "asset_folder" {
  # https://cloud.google.com/storage/docs/locations
  default     = "placeholder"
  description = "Local do bucket de assets"
}


variable "slug" {
  description = "Slug do projeto/serviço/sistema na sua plataforma"
  default     = "my-project"
  type        = string
}

variable "k8s_cluster_name" {
  default     = "my-cluster"
  description = "K8s: Nome do cluster Kubernetes"
}

variable "k8s_cluster_zone" {
  default     = "placeholder"
  description = "K8s: Zona do cluster Kubernetes"
}

variable "secrets_topic_id" {
  default     = "placeholder"
  description = "PubSub Tópic que indica a necessidade de se reconstruir os segredos do app no cluster kubernetes"
}

variable "config_topic_id" {
  default     = "placeholder"
  description = "PubSub topic que indica a necessidade de se reconstruir as configurações do app no cluster kubernetes"
}

