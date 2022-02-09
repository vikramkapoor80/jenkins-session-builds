terraform {
  backend "s3" {
    bucket = "jenkinsbuild1"
    key    = "state/terraform.tfstate"
    region = "us-east-1"
    }
}
