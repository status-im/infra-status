# Description
This repo defines infrastructure for running [nim-waku](github.com/status-im/nim-waku) nodes shards.

There are 3 kinds of nodes:
- `boot` - bootstrap nodes, no storage
- `store` - messages store nodes
- `store-db` - PostgreSQL used by `store` nodes for storage

# Continious Integration
Jenkins CI builds can be used to build and deploy new Docker images:
- `shards.test`: https://ci.infra.status.im/job/nim-waku/job/deploy-shards-test/

# Repo Usage

For how to use this repo read the [Infra Repo Usage](https://github.com/status-im/infra-docs/blob/master/docs/general/infra_repo_usage.md) doc.
