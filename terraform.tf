terraform {
  backend "gcs" {
    credentials = "./milan-gcp-test-account.json"
    bucket      = "milan-gcp-terra-bucket"
    prefix      = "terraform/state"
  }
}