

# fila onde irão transitar todas os eventos de atualização de secrets
resource "google_pubsub_topic" "app-secrets-topic" {
  name = var.secrets_topic_id
}

resource "google_pubsub_subscription" "app-secrets-subscription" {
  name    = lower("update-secrets-${var.secrets_topic_id}-sub")
  topic   = google_pubsub_topic.app-secrets-topic.id
  project = var.project_id

  ack_deadline_seconds = 10

  labels = {
    app = "${var.slug}"
  }

  filter = "attributes.secretId = \"SOME_SECRET\" AND (attributes.eventType = \"SECRET_CREATE\" ) OR (attributes.eventType = \"SECRET_UPDATE\" ) "

  message_retention_duration = "600s"
}


resource "google_cloudbuild_trigger" "update-secrets" {

  approval_config {
    approval_required = "false"
  }

  tags = ["secrets"]

  disabled = "true"

  filename = "ci/cloudbuild-update-secrets.yaml"
  project  = var.project_id
  name     = upper("${var.slug}-app-update-k8s-secrets")

  pubsub_config {
    topic = google_pubsub_topic.app-secrets-topic.id
  }
}

