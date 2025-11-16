terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "jibins-test"

    workspaces {
      name = "test"
    }
  }
}
