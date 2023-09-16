resource "google_cloudbuild_trigger" "build-app" {

  disabled = "false"
  filename = "ci/cloudbuild-app.yaml"
  project  = var.project_id
  name     = upper("${var.slug}-build-app")

  trigger_template {
    repo_name   = var.git_repo_id
    branch_name = var.git_repo_branch
    project_id  = var.project_id
  }

  included_files = [
    "src/**",
    "Dockerfile",
    "ci/cloud-build-app.yaml"
  ]
  ignored_files = []

  tags = ["web"]

  # location = var.build_region

  approval_config {
    approval_required = "false"
  }

  # Minimo necessário para salvar imagem em Google Cloud Artifact
  substitutions = {
    _ARTIFACT_HOST_ = var.artifact_region
    _ARTIFACT_REPO_ = var.artifact_repo_id
    _BUCKET_        = var.asset_bucket
    _FOLDER_        = var.asset_folder
    _IMAGE_NAME_    = "${var.slug}-app"
  }
}


