resource "google_cloudbuild_trigger" "manual-deploy-app" {

  disabled    = "true"
  filename    = "ci/cloudbuild-deploy-k8s.yaml"
  project     = var.project_id
  name        = upper("manual-deploy-${var.system_slug}-app")
  description = "Manual deployment"

  trigger_template {
    repo_name   = var.git_repo_id
    branch_name = var.git_repo_branch
    project_id  = var.project_id
  }

  # location = var.build_region

  approval_config {
    approval_required = "true"
  }

  substitutions = {
    "_COMPUTE_ZONE_"           = var.k8s_cluster_zone
    "_CONTAINER_CLUSTER_NAME_" = var.k8s_cluster_name
  }

}

resource "google_cloudbuild_trigger" "auto-deploy-app" {

  disabled    = "false"
  filename    = "ci/cloudbuild-deploy-k8s.yaml"
  project     = var.project_id
  name        = upper("auto-deploy-${var.system_slug}-app")
  description = "Automatic deployment"

  trigger_template {
    repo_name   = var.git_repo_id
    branch_name = var.git_repo_branch
    project_id  = var.project_id
  }

  # location = var.build_region

  approval_config {
    approval_required = "false"
  }

  substitutions = {
    "_COMPUTE_ZONE_"           = var.k8s_cluster_zone
    "_CONTAINER_CLUSTER_NAME_" = var.k8s_cluster_name
  }

}

resource "google_cloudbuild_trigger" "undo-deploy" {

  disabled    = "true"
  filename    = "ci/cloudbuild-undo-deploy-k8s.yaml"
  project     = var.project_id
  name        = upper("undo-deploy-${var.system_slug}-app")
  description = "Undo last deployment"

  # manual = source_to_build
  source_to_build {
    uri       = var.git_repo_id
    ref       = var.git_repo_branch # "refs/heads/main"
    repo_type = "BITBUCKET_SERVER"
  }

  # location = var.build_region

  approval_config {
    approval_required = "false"
  }

  substitutions = {
    "_COMPUTE_ZONE_"           = var.k8s_cluster_zone
    "_CONTAINER_CLUSTER_NAME_" = var.k8s_cluster_name
  }

}


