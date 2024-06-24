terraform {
  required_version = "> 1.4.0"
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
    }
    digitalocean = {
      source = "digitalocean/digitalocean"
    }
    alicloud = {
      source = "aliyun/alicloud"
    }
    google = {
      source = "hashicorp/google"
    }
    pass = {
      source  = "camptocamp/pass"
      version = " = 2.1.1"
    }
  }
}
