Создание роли репликатора

`docker exec -it main psql -U postgres -d postgres`
`CREATE ROLE replicator WITH REPLICATION LOGIN PASSWORD 'replicator';`
`\du`
<img width="838" alt="image" src="https://github.com/user-attachments/assets/95e447ea-3077-4f9a-85a0-90223c2f9ac9" />

