Создание роли репликатора

`docker exec -it main psql -U postgres -d postgres`
`CREATE ROLE replicator WITH REPLICATION LOGIN PASSWORD 'replicator';`
`\du`
