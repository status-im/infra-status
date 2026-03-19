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

      boot_ac_count = 1
      boot_do_count = 1
      boot_gc_count = 1

      store_ac_count = 2
      store_do_count = 2
      store_gc_count = 2

      store_db_ac_count = 1
      store_db_do_count = 1
      store_db_gc_count = 1

      store_db_data_vol_size = 100

      store_do_type = "s-1vcpu-2gb"        /* DigitalOcean */
      store_ac_type = "ecs.t5-lc1m2.small" /* Alibaba Cloud */
      store_gc_type = "g1-small"           /* Google Cloud */

      boot_do_type = "s-1vcpu-2gb"        /* DigitalOcean */
      boot_ac_type = "ecs.t5-lc1m2.small" /* Alibaba Cloud */
      boot_gc_type = "g1-small"           /* Google Cloud */

      store_db_do_type = "s-1vcpu-2gb"          /* DigitalOcean */
      store_db_ac_type = "ecs.t5-lc1m2.small"   /* Alibaba Cloud */
      store_db_gc_type = "g1-small"             /* Google Cloud */
    }

    /* Settings specific to the test fleet/workspace. */
    prod = {
      boot_do_type = "s-2vcpu-4gb"
      boot_ac_type = "ecs.t5-lc1m2.large"
      boot_gc_type = "c2d-standard-2"

      store_do_type = "s-4vcpu-8gb"
      store_ac_type = "ecs.t5-lc1m4.large"
      store_gc_type = "c2d-standard-4"

      store_db_do_type = "c2-16vcpu-32gb-intel"
      store_db_ac_type = "ecs.c6.4xlarge"
      store_db_gc_type = "c2d-highcpu-16"

      store_db_data_vol_size = 320
    }
    /* DO data center only to limit costs. */
    staging = {
      boot_ac_count = 0
      boot_do_count = 1
      boot_gc_count = 0

      store_ac_count = 0
      store_do_count = 2
      store_gc_count = 0

      store_db_ac_count = 0
      store_db_do_count = 1
      store_db_gc_count = 0

      store_do_type = "s-2vcpu-4gb"
      boot_do_type = "s-2vcpu-4gb"
      store_db_do_type = "s-2vcpu-4gb"
    }
  }
}

/* Makes fleet settings available under local.ws. */
locals {
  ws = merge(local.env["defaults"], local.env[terraform.workspace])
}
