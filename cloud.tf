terraform {
  cloud {
    organization = "DARI-Motion"

    workspaces {
      name = "new-instance-creation"
    }
  }
}
