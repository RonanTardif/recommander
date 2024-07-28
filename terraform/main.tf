# terraform/main.tf

provider "google" {
  project = var.project_id
  region  = var.region
}

resource "google_cloud_run_service" "recommender_service" {
  name     = "recommender-service"
  location = var.region

  template {
    spec {
      containers {
        image = "gcr.io/${var.project_id}/recommender-service:latest"
        ports {
          container_port = 8080
        }
      }
    }
  }
}

resource "google_cloud_run_service_iam_member" "invoker" {
  service_name = google_cloud_run_service.recommender_service.name
  location     = google_cloud_run_service.recommender_service.location
  role         = "roles/run.invoker"
  member       = "allUsers"
}

output "service_url" {
  value = google_cloud_run_service.recommender_service.status[0].url
}
