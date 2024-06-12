module "store-db" {
  source = "github.com/status-im/infra-tf-multi-provider"

  /* node type */
  name   = "store-db"
  group  = "store-db"
  env    = "shards"
  stage  = terraform.workspace

  /* scaling */
  host_count = local.ws["store_db_hosts_count"]

  /* instance sizes */
  do_type = local.ws["db_do_type"] /* DigitalOcean */
  ac_type = local.ws["db_ac_type"] /* Alibaba Cloud */
  gc_type = local.ws["db_gc_type"] /* Google Cloud */

  /* data volumes */
  ac_data_vol_size = local.ws["store_db_data_vol_size"]
  do_data_vol_size = local.ws["store_db_data_vol_size"]
  gc_data_vol_size = local.ws["store_db_data_vol_size"]
}

