/**
 * This is a hacky way of binding specific variable
 * values to different Terraform workspaces.
 *
 * Details:
 * https://github.com/hashicorp/terraform/issues/15966
 */

locals {
  env = {
    defaults = {
      /* Default settings for all fleets/workspaces. */

      boot_hosts_count = 1
      store_hosts_count = 2
      store_db_hosts_count = 1
      store_db_data_vol_size = 100

      node_do_type = "s-1vcpu-2gb"        /* DigitalOcean */
      node_ac_type = "ecs.t5-lc1m2.small" /* Alibaba Cloud */
      node_gc_type = "g1-small"           /* Google Cloud */

      db_do_type = "s-1vcpu-2gb"          /* DigitalOcean */
      db_ac_type = "ecs.t5-lc1m2.small"   /* Alibaba Cloud */
      db_gc_type = "g1-small"             /* Google Cloud */
    }

    /* Settings specific to the test fleet/workspace. */
    test = {
      db_do_type = "s-2vcpu-4gb"
      db_ac_type = "ecs.c6.large"
      db_gc_type = "c2d-highcpu-2"

      store_db_data_vol_size = 150
    }
    staging = {
      /* Settings specific to the test fleet/workspace. */
    }
  }
}

/* Makes fleet settings available under local.ws. */
locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
