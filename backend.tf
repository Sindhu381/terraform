terraform {
  backend "s3"{
  bucket  = "terraform-tf-store"
  key = "terrfunctions"
  region = "us-east-1"
  }
}
