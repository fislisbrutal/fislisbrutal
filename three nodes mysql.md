#Поднимаем три узла по очереди

```
gl.matveev@MAC2443OKKO desktop % docker run -d \
--name pxc-node1 \
--network pxc-network \
-e MYSQL_ROOT_PASSWORD=qwerty \
percona/percona-xtradb-cluster:8.0
32fd132bcc766d65be6349050518510bf534dc97411e2fb62ed640bbee94af20

gl.matveev@MAC2443OKKO desktop % docker run -d \
--name pxc-node2 \
--network pxc-network \
-e CLUSTER_ADDRESS=gcomm://pxc-node1 \
-e XTRADB_CLUSTER_NAME=my_pxc_cluster \
-e XTRADB_CLUSTER_GTID_MODE=ON \
-e XTRADB_CLUSTER_NODE_ADDRESS=pxc-node2 \
-e MYSQL_ROOT_PASSWORD=qwerty \
percona/percona-xtradb-cluster:8.0
f2af37b8bd836c0317e301f1a8a94f58536b0cd6725694665952f9fdbc641ee2

gl.matveev@MAC2443OKKO desktop % docker run -d \
--name pxc-node3 \
--network pxc-network \
-e CLUSTER_ADDRESS=gcomm://pxc-node1,pxc-node2 \
-e XTRADB_CLUSTER_NAME=my_pxc_cluster \
-e XTRADB_CLUSTER_GTID_MODE=ON \
-e XTRADB_CLUSTER_NODE_ADDRESS=pxc-node3 \
-e MYSQL_ROOT_PASSWORD=qwerty \
percona/percona-xtradb-cluster:8.0
8a3322741225716d4a46b1e37ab2423d26eff4468b509a1d8a889a5fd452e1d6
```
<img width="989" height="271" alt="image" src="https://github.com/user-attachments/assets/a1099731-c744-4022-b42b-bc299562991c" />

# Создаем БД на первом узле и добавляем данные

```
CREATE DATABASE mydb;

USE mydb;
CREATE TABLE test (
   id INT AUTO_INCREMENT PRIMARY KEY,
   value VARCHAR(255)
);

INSERT INTO test(value) VALUES 
('test1'),
('test2'),
('test3'),
('test4'),
('test5');
```

<img width="847" height="290" alt="image" src="https://github.com/user-attachments/assets/d68462f3-7adb-4f5d-83a8-039f2598aa82" />

