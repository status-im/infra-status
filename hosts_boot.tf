module "boot" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  name   = "boot"
  group  = "boot"
  env    = "shards"
  stage  = terraform.workspace
  domain = var.domain

  /* scaling */
  host_count = local.ws["boot_hosts_count"]

  /* instance sizes */
  do_type = local.ws["do_type"] /* DigitalOcean */
  ac_type = local.ws["ac_type"] /* Alibaba Cloud */
  gc_type = local.ws["gc_type"] /* Google Cloud */

  /* data volumes */
  ac_data_vol_size = local.ws["data_vol_size"]
  do_data_vol_size = local.ws["data_vol_size"]
  gc_data_vol_size = local.ws["data_vol_size"]

  /* firewall */
  open_tcp_ports = [
    "80", /* certbot */
    "443", /* p2p websockify */
    "8000", /* p2p websocket */
  ]
  open_udp_ports = [
    "9000", /* discovery v5 */
  ]
}

