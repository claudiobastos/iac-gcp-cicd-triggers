# Informações necessárias para estruturar o projeto que constrói e armazena os artefatos de código

variable "gcp_terraform_credentials" {
  description = "Conta de serviço com permissões necessárias para o terraform funcionar"
  default     = "gcp-terraform.json"
}

variable "project_id" {
  description = "Nome do projeto do GCP"
  default     = ""
}

variable "region" {
  description = "Padrão para regiões de recursos no GCP"
  default     = "us-east1"
}

variable "zone" {
  description = "Padrão para zonas de recursos no GCP"
  default     = "us-east1-a"
}

variable "biz_platform_id" {
  description = "ID da plataforma"
  default     = "plat-123"
}

variable "biz_platform_slug" {
  description = "Slug da plataforma"
  default     = "plat-123"
}

variable "biz_system_slug" {
  description = "Slug do sistema"
  default     = "sys"
}

variable "biz_app_slug" {
  description = "Slug da aplicação"
  default     = "app"
}

variable "system_slug" {
  description = "Slug do projeto/serviço/sistema na sua plataforma"
  default     = "my-project"
}

variable "git_provider_id" {
  # limitar opções com base em lista
  default     = "bitbucket"
  description = "Project's git repository service provider"
  validation {
    condition     = contains(["bitbucket", "github", "gitlab"], var.git_provider_id)
    error_message = "Valores válidos para o provedor git: git_provider_id are (bitbucket, github, gitlab)."
  }
}

variable "git_repo_team_id" {
  default     = "my-team"
  description = "Project's Team ID in the Git Service Provider"
}

variable "git_repo_id" {
  default     = "team/project.git"
  description = "Project's git url"
}

variable "git_default_branch" {
  default     = "refs/heads/main"
  description = "Default branch para os triggers"
}

variable "artifact_repo_id" {
  default     = "fake-artifact-repo-id"
  description = "Nome do repositório de artefatos"
}

variable "artifact_region" {
  default     = "us-east1-a"
  description = "Região do repositório de artefatos"
}

variable "asset_bucket" {
  default     = "fake-platform-bucket"
  description = "Bucket que armazena assets relativos aos projetos"
}

variable "asset_folder" {
  # https://cloud.google.com/storage/docs/locations
  default     = "fake-system-folder"
  description = "Local do bucket de assets"
}

variable "deploy_k8s_zone" {
  # https://cloud.google.com/storage/docs/locations
  default     = "us-east1-a"
  description = "Zona do cluster"
}

variable "deploy_k8s_name" {
  # https://cloud.google.com/storage/docs/locations
  default     = "my-cluster"
  description = "Nome do cluster"
}

variable "pubsub_secrets_topic_id" {
  default     = "fake-pubsub-topic-to-listen"
  description = "Tópico PubSub que indica a necessidade de se reconstruir os segredos do app no cluster kubernetes"
}

variable "pubsub_config_topic_id" {
  default     = "fake-pubsub-topic-to-listen"
  description = "PubSub topic que indica a necessidade de se reconstruir as configurações do app no cluster kubernetes"
}
