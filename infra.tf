variable "service_account_key" {
  type        = string
  description = "Path to GCP service account key"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}


provider "google" {
  version = "3.11.0"

  credentials = file(var.service_account_key)

  project = var.project_id
  region  = "europe-west1"
  zone    = "europe-west1-b"
}

resource "google_container_cluster" "primary" {
  name = "customers-cluster"
  # single zone cluster
  location = "europe-west1-b"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    # disable basic authentication for k8s master endpoint
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_preemptible_nodes" {
  name       = "primary_node_pool"
  location   = "europe-west1-b"
  cluster    = google_container_cluster.primary.name
  node_count = 3

  node_config {
    preemptible  = true
    machine_type = "g1-small"

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
