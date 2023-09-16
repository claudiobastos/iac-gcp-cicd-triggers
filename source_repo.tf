# https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/sourcerepo_repository
resource "google_sourcerepo_repository" "app-repo" {
  name = "${var.git_provider_id}_${var.git_repo_team_id}_${var.git_repo_id}"
}
