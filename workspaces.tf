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

      store_do_type = "s-1vcpu-2gb"        /* DigitalOcean */
      store_ac_type = "ecs.t5-lc1m2.small" /* Alibaba Cloud */
      store_gc_type = "g1-small"           /* Google Cloud */

      boot_do_type = "s-1vcpu-2gb"        /* DigitalOcean */
      boot_ac_type = "ecs.t5-lc1m2.small" /* Alibaba Cloud */
      boot_gc_type = "g1-small"           /* Google Cloud */

      db_do_type = "s-1vcpu-2gb"          /* DigitalOcean */
      db_ac_type = "ecs.t5-lc1m2.small"   /* Alibaba Cloud */
      db_gc_type = "g1-small"             /* Google Cloud */
    }

    /* Settings specific to the test fleet/workspace. */
    prod = {
      store_do_type = "s-4vcpu-8gb"
      store_ac_type = "ecs.t5-lc1m4.large"
      store_gc_type = "c2d-standard-4"

      boot_do_type = "s-2vcpu-4gb"
      boot_ac_type = "ecs.t5-lc1m2.large"
      boot_gc_type = "c2d-standard-2"

      db_do_type = "c2-16vcpu-32gb-intel"
      db_ac_type = "ecs.c6.4xlarge"
      db_gc_type = "c2d-highcpu-16"

      store_db_data_vol_size = 320
    }
    staging = {
      store_do_type = "s-2vcpu-4gb"
      store_ac_type = "ecs.t5-lc1m2.large"
      store_gc_type = "c2d-highcpu-2"

      boot_do_type = "s-2vcpu-4gb"
      boot_ac_type = "ecs.t5-lc1m2.large"
      boot_gc_type = "c2d-highcpu-2"

      db_do_type = "s-2vcpu-4gb"
      db_ac_type = "ecs.t5-lc1m2.large"
      db_gc_type = "c2d-highcpu-2"
    }
  }
}

/* Makes fleet settings available under local.ws. */
locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
