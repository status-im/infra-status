module "boot" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  name   = "boot"
  group  = "boot"
  env    = "status"
  stage  = terraform.workspace

  /* scaling */
  host_count = local.ws["boot_hosts_count"]

  /* instance sizes */
  do_type = local.ws["boot_do_type"] /* DigitalOcean */
  ac_type = local.ws["boot_ac_type"] /* Alibaba Cloud */
  gc_type = local.ws["boot_gc_type"] /* Google Cloud */

  /* firewall */
  open_tcp_ports = [
    "30303", /* p2p main */
    "443",   /* websocket */
    "80",    /* certbot */
  ]
  open_udp_ports = [
    "9000", /* discovery v5 */
  ]
}

