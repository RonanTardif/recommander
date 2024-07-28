# terraform/outputs.tf

output "service_url" {
  description = "URL du service Cloud Run"
  value       = google_cloud_run_service.recommender_service.status[0].url
}
