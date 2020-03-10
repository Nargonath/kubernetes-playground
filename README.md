<div align="center">
  <h1>Kubernetes playground</h1>
  <strong>An attempt at a not too complicated kubernetes architecture hosted on GKE</strong>
</div>

<hr>

# Architecture

The point of this project is to try a basic kubernetes cluster architecture with:

- 2 NodeJS Servers scaled through multiple pods
- 1 managed Cloud SQL PostgreSQL
- 1 Cloud load balancer
- 1 Cloud Endpoint API Gateway

This infrastructure will be hosted on GCP.

# Features

- [ ] Server replication and scaling
- [ ] Database pod
- [ ] Database backup
- [ ] Logging
  - [ ] Error logging
  - [ ] Normal logging
- [ ] Monitoring
  - [ ] APM
- [ ] Secret management

# Requirements

To work with GCP Terraform needs a service account key and a GCP project ID.
