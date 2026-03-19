output "hosts" {
  value = merge(
    module.boot.hosts,
    module.store.hosts,
    module.store-db.hosts
  )
}
