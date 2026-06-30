/* DATA -----------------------------------------*/

terraform {
  backend "consul" {
    address = "https://consul-api.infra.status.im:8400"
    /* Lock to avoid syncing issues */
    lock = true
    /* KV store has a limit of 512KB */
    gzip = true
    /* WARNING This needs to be changed for every repo. */
    path = "terraform/shards/"
  }
}
