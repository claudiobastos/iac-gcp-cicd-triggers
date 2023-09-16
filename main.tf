
# resource "random_id" "rnd_suffix" {
#   byte_length = 8
# }

module "build-app" {
  gcp_credentials = var.gcp_terraform_credentials
  project_id      = var.project_id

  source             = "./ci-pipeline"
  git_repo_id        = google_sourcerepo_repository.app-repo.id
  git_repo_branch    = var.git_default_branch
  slug               = "${var.biz_platform_slug}-${var.biz_system_slug}-${var.biz_app_slug}"

  artifact_repo_id = var.artifact_repo_id
  artifact_region  = var.artifact_region

  asset_bucket = var.asset_bucket
  asset_folder = var.asset_folder

  secrets_topic_id = var.pubsub_secrets_topic_id

}

module "deploy-app" {
  gcp_credentials = var.gcp_terraform_credentials
  project_id      = var.project_id

  source          = "./cd-pipeline"
  git_repo_id     = google_sourcerepo_repository.app-repo.id
  git_repo_branch = var.git_default_branch
  system_slug     = var.system_slug

  k8s_cluster_name = var.deploy_k8s_name
  k8s_cluster_zone = var.deploy_k8s_zone

}