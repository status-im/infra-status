# Description

This repo defines infrastructure for running [nim-waku](github.com/status-im/nim-waku) nodes.

There are 3 kinds of nodes:

* `boot` - Bootstrap nodes. No `store` protcol enabled.
* `store` - Messages store nodes with `relay`, and `store` protocols.
* `store-db` - PostgreSQL used by `store` nodes for envelope storage.

# Discovery

DNS `TXT` ENRTree records exist to discover available fleets:
```
enrtree://AMOJVZX4V6EXP7NTJPMAYJYST2QP6AJXYW76IU6VGJS7UVSNDYZG4@boot.prod.status.nodes.status.im
enrtree://AMOJVZX4V6EXP7NTJPMAYJYST2QP6AJXYW76IU6VGJS7UVSNDYZG4@store.prod.status.nodes.status.im
```
```
enrtree://AI4W5N5IFEUIHF5LESUAOSMV6TKWF2MB6GU2YK7PU4TYUGUNOCEPW@boot.staging.status.nodes.status.im
enrtree://AI4W5N5IFEUIHF5LESUAOSMV6TKWF2MB6GU2YK7PU4TYUGUNOCEPW@store.staging.status.nodes.status.im
```

# Continious Integration

Jenkins CI builds can be used to build and deploy new Docker images:

* `status.staging` - https://ci.infra.status.im/job/nim-waku/job/deploy-status-staging/
* `status.prod` - https://ci.infra.status.im/job/nim-waku/job/deploy-status-test/

# Repo Usage

For how to use this repo read the [Infra Repo Usage](https://github.com/status-im/infra-docs/blob/master/docs/general/infra_repo_usage.md) doc.
