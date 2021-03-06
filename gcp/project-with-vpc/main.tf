data "google_folder" "folder" {
  folder = var.folder
}

resource "google_project" "project" {
  name       = var.project_name
  project_id = var.project_id
  folder_id  = data.google_folder.folder.id
}

resource "google_compute_subnetwork" "main_subnet" {
  name          = "main-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.main_network.self_link
}

resource "google_project_service" "compute" {
  project = "your-project-id"
  service = "compute.googleapis.com"

  disable_dependent_services = true
}

resource "google_compute_network" "main_network" {
  name                    = "main"
  project                 = google_project.project.number
  auto_create_subnetworks = false
}
