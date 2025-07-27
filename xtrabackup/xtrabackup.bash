fislis@Matveev-victus:~/world-db-restore$ sudo xtrabackup --user=root --password="MyNewStrongPassword!" \
--backup --stream=xbstream \
--target-dir=/tmp/backup \
| gzip - | openssl aes-256-cbc -salt -pbkdf2 -k "password" > backup.xbs.gz.aes
2025-07-28T01:01:32.962309+03:00 0 [Note] [MY-011825] [Xtrabackup] recognized client arguments: --user=root --password=* --backup=1 --stream=xbstream --target-dir=/tmp/backup
xtrabackup version 8.0.35-30 based on MySQL server 8.0.35 Linux (x86_64) (revision id: 6beb4b49)
250728 01:01:33  version_check Connecting to MySQL server with DSN 'dbi:mysql:;mysql_read_default_group=xtrabackup' as 'root'  (using password: YES).
250728 01:01:33  version_check Connected to MySQL server
250728 01:01:33  version_check Executing a version check against the server...
250728 01:01:33  version_check Done.
2025-07-28T01:01:33.016237+03:00 0 [Note] [MY-011825] [Xtrabackup] Connecting to MySQL server host: localhost, user: root, password: set, port: not set, socket: not set
2025-07-28T01:01:33.024512+03:00 0 [Note] [MY-011825] [Xtrabackup] Using server version 8.0.42-0ubuntu0.24.04.2
2025-07-28T01:01:33.026489+03:00 0 [Note] [MY-011825] [Xtrabackup] Executing LOCK INSTANCE FOR BACKUP ...
2025-07-28T01:01:33.027167+03:00 0 [Note] [MY-011825] [Xtrabackup] uses posix_fadvise().
2025-07-28T01:01:33.027207+03:00 0 [Note] [MY-011825] [Xtrabackup] cd to /var/lib/mysql/
2025-07-28T01:01:33.027223+03:00 0 [Note] [MY-011825] [Xtrabackup] open files limit requested 0, set to 1024
2025-07-28T01:01:33.027637+03:00 0 [Note] [MY-011825] [Xtrabackup] using the following InnoDB configuration:
2025-07-28T01:01:33.027661+03:00 0 [Note] [MY-011825] [Xtrabackup] innodb_data_home_dir = .
2025-07-28T01:01:33.027679+03:00 0 [Note] [MY-011825] [Xtrabackup] innodb_data_file_path = ibdata1:12M:autoextend
2025-07-28T01:01:33.027710+03:00 0 [Note] [MY-011825] [Xtrabackup] innodb_log_group_home_dir = ./
2025-07-28T01:01:33.027732+03:00 0 [Note] [MY-011825] [Xtrabackup] innodb_log_files_in_group = 2
2025-07-28T01:01:33.027743+03:00 0 [Note] [MY-011825] [Xtrabackup] innodb_log_file_size = 50331648
2025-07-28T01:01:33.029818+03:00 0 [Note] [MY-011825] [Xtrabackup] inititialize_service_handles suceeded
2025-07-28T01:01:33.101795+03:00 0 [Note] [MY-011825] [Xtrabackup] Connecting to MySQL server host: localhost, user: root, password: set, port: not set, socket: not set
2025-07-28T01:01:33.108109+03:00 0 [Note] [MY-011825] [Xtrabackup] Redo Log Archiving is not set up.
2025-07-28T01:01:33.204235+03:00 1 [Note] [MY-011825] [Xtrabackup] >> log scanned up to (20351037)
2025-07-28T01:01:33.205459+03:00 0 [Note] [MY-012953] [InnoDB] Disabling background ibuf IO read threads.
2025-07-28T01:01:33.406946+03:00 0 [Note] [MY-011825] [Xtrabackup] Generating a list of tablespaces
2025-07-28T01:01:33.407018+03:00 0 [Note] [MY-012204] [InnoDB] Scanning './'
2025-07-28T01:01:33.408595+03:00 0 [Note] [MY-012208] [InnoDB] Completed space ID check of 2 files.
2025-07-28T01:01:33.408869+03:00 0 [Warning] [MY-012091] [InnoDB] Allocated tablespace ID 10 for world/countrylanguage, old maximum was 0
2025-07-28T01:01:33.413888+03:00 0 [Note] [MY-013252] [InnoDB] Using undo tablespace './undo_001'.
2025-07-28T01:01:33.414443+03:00 0 [Note] [MY-013252] [InnoDB] Using undo tablespace './undo_002'.
2025-07-28T01:01:33.415441+03:00 0 [Note] [MY-012910] [InnoDB] Opened 2 existing undo tablespaces.
2025-07-28T01:01:33.415932+03:00 2 [Note] [MY-011825] [Xtrabackup] Streaming ./ibdata1
2025-07-28T01:01:33.484539+03:00 2 [Note] [MY-011825] [Xtrabackup] Done: Streaming ./ibdata1
2025-07-28T01:01:33.495121+03:00 2 [Note] [MY-011825] [Xtrabackup] Streaming ./sys/sys_config.ibd
2025-07-28T01:01:33.495359+03:00 2 [Note] [MY-011825] [Xtrabackup] Done: Streaming ./sys/sys_config.ibd
2025-07-28T01:01:33.502441+03:00 2 [Note] [MY-011825] [Xtrabackup] Streaming ./world/city.ibd
2025-07-28T01:01:33.502555+03:00 2 [Note] [MY-011825] [Xtrabackup] Done: Streaming ./world/city.ibd
2025-07-28T01:01:33.503269+03:00 2 [Note] [MY-011825] [Xtrabackup] Streaming ./world/country.ibd
2025-07-28T01:01:33.503376+03:00 2 [Note] [MY-011825] [Xtrabackup] Done: Streaming ./world/country.ibd
2025-07-28T01:01:33.504022+03:00 2 [Note] [MY-011825] [Xtrabackup] Streaming ./world/countrylanguage.ibd
2025-07-28T01:01:33.504163+03:00 2 [Note] [MY-011825] [Xtrabackup] Done: Streaming ./world/countrylanguage.ibd
2025-07-28T01:01:33.504932+03:00 2 [Note] [MY-011825] [Xtrabackup] Streaming ./mysql.ibd
2025-07-28T01:01:33.731751+03:00 2 [Note] [MY-011825] [Xtrabackup] Done: Streaming ./mysql.ibd
2025-07-28T01:01:33.753106+03:00 2 [Note] [MY-011825] [Xtrabackup] Streaming ./undo_002
2025-07-28T01:01:33.816053+03:00 2 [Note] [MY-011825] [Xtrabackup] Done: Streaming ./undo_002
2025-07-28T01:01:33.841421+03:00 2 [Note] [MY-011825] [Xtrabackup] Streaming ./undo_001
2025-07-28T01:01:33.905807+03:00 2 [Note] [MY-011825] [Xtrabackup] Done: Streaming ./undo_001
2025-07-28T01:01:34.204442+03:00 1 [Note] [MY-011825] [Xtrabackup] >> log scanned up to (20351037)
2025-07-28T01:01:34.415833+03:00 0 [Note] [MY-011825] [Xtrabackup] Starting to backup non-InnoDB tables and files
2025-07-28T01:01:34.416609+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming mysql/slow_log.CSM to <STDOUT>
2025-07-28T01:01:34.417041+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming mysql/slow_log.CSM to <STDOUT>
2025-07-28T01:01:34.417151+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming mysql/general_log_213.sdi to <STDOUT>
2025-07-28T01:01:34.417404+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming mysql/general_log_213.sdi to <STDOUT>
2025-07-28T01:01:34.425739+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming mysql/slow_log_214.sdi to <STDOUT>
2025-07-28T01:01:34.426080+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming mysql/slow_log_214.sdi to <STDOUT>
2025-07-28T01:01:34.426430+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming mysql/slow_log.CSV to <STDOUT>
2025-07-28T01:01:34.426460+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming mysql/slow_log.CSV to <STDOUT>
2025-07-28T01:01:34.426749+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming mysql/general_log.CSM to <STDOUT>
2025-07-28T01:01:34.427045+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming mysql/general_log.CSM to <STDOUT>
2025-07-28T01:01:34.427348+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming mysql/general_log.CSV to <STDOUT>
2025-07-28T01:01:34.427379+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming mysql/general_log.CSV to <STDOUT>
2025-07-28T01:01:34.427633+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming <STDOUT>
2025-07-28T01:01:34.427659+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming file <STDOUT>
2025-07-28T01:01:34.427921+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/table_lock_waits_109.sdi to <STDOUT>
2025-07-28T01:01:34.428364+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/table_lock_waits_109.sdi to <STDOUT>
2025-07-28T01:01:34.428691+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/session_status_182.sdi to <STDOUT>
2025-07-28T01:01:34.428934+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/session_status_182.sdi to <STDOUT>
2025-07-28T01:01:34.429236+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/table_io_waits_s_108.sdi to <STDOUT>
2025-07-28T01:01:34.429534+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/table_io_waits_s_108.sdi to <STDOUT>
2025-07-28T01:01:34.429877+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_126.sdi to <STDOUT>
2025-07-28T01:01:34.430195+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_126.sdi to <STDOUT>
2025-07-28T01:01:34.430511+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/data_locks_160.sdi to <STDOUT>
2025-07-28T01:01:34.430807+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/data_locks_160.sdi to <STDOUT>
2025-07-28T01:01:34.431109+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_128.sdi to <STDOUT>
2025-07-28T01:01:34.431423+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_128.sdi to <STDOUT>
2025-07-28T01:01:34.431716+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/memory_summary_b_155.sdi to <STDOUT>
2025-07-28T01:01:34.432012+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/memory_summary_b_155.sdi to <STDOUT>
2025-07-28T01:01:34.432324+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/global_variables_184.sdi to <STDOUT>
2025-07-28T01:01:34.432530+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/global_variables_184.sdi to <STDOUT>
2025-07-28T01:01:34.432831+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/variables_info_186.sdi to <STDOUT>
2025-07-28T01:01:34.433027+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/variables_info_186.sdi to <STDOUT>
2025-07-28T01:01:34.433339+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/socket_summary_b_149.sdi to <STDOUT>
2025-07-28T01:01:34.433613+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/socket_summary_b_149.sdi to <STDOUT>
2025-07-28T01:01:34.433910+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/status_by_accoun_177.sdi to <STDOUT>
2025-07-28T01:01:34.434123+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/status_by_accoun_177.sdi to <STDOUT>
2025-07-28T01:01:34.434475+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_transacti_131.sdi to <STDOUT>
2025-07-28T01:01:34.434757+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_transacti_131.sdi to <STDOUT>
2025-07-28T01:01:34.435081+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_122.sdi to <STDOUT>
2025-07-28T01:01:34.435384+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_122.sdi to <STDOUT>
2025-07-28T01:01:34.435729+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/socket_instances_147.sdi to <STDOUT>
2025-07-28T01:01:34.435998+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/socket_instances_147.sdi to <STDOUT>
2025-07-28T01:01:34.436297+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_stages_cu_111.sdi to <STDOUT>
2025-07-28T01:01:34.436541+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_stages_cu_111.sdi to <STDOUT>
2025-07-28T01:01:34.436836+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_waits_sum_92.sdi to <STDOUT>
2025-07-28T01:01:34.437098+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_waits_sum_92.sdi to <STDOUT>
2025-07-28T01:01:34.437417+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_stages_hi_112.sdi to <STDOUT>
2025-07-28T01:01:34.437680+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_stages_hi_112.sdi to <STDOUT>
2025-07-28T01:01:34.437981+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_errors_su_143.sdi to <STDOUT>
2025-07-28T01:01:34.438189+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_errors_su_143.sdi to <STDOUT>
2025-07-28T01:01:34.438475+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/setup_instrument_104.sdi to <STDOUT>
2025-07-28T01:01:34.438698+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/setup_instrument_104.sdi to <STDOUT>
2025-07-28T01:01:34.439020+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_errors_su_141.sdi to <STDOUT>
2025-07-28T01:01:34.439271+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_errors_su_141.sdi to <STDOUT>
2025-07-28T01:01:34.439556+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/rwlock_instances_101.sdi to <STDOUT>
2025-07-28T01:01:34.439867+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/rwlock_instances_101.sdi to <STDOUT>
2025-07-28T01:01:34.440144+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/keyring_keys_152.sdi to <STDOUT>
2025-07-28T01:01:34.440405+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/keyring_keys_152.sdi to <STDOUT>
2025-07-28T01:01:34.440691+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_waits_his_85.sdi to <STDOUT>
2025-07-28T01:01:34.441030+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_waits_his_85.sdi to <STDOUT>
2025-07-28T01:01:34.441339+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/tls_channel_stat_190.sdi to <STDOUT>
2025-07-28T01:01:34.441654+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/tls_channel_stat_190.sdi to <STDOUT>
2025-07-28T01:01:34.441956+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_grou_169.sdi to <STDOUT>
2025-07-28T01:01:34.442230+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_grou_169.sdi to <STDOUT>
2025-07-28T01:01:34.442520+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/keyring_componen_191.sdi to <STDOUT>
2025-07-28T01:01:34.442727+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/keyring_componen_191.sdi to <STDOUT>
2025-07-28T01:01:34.443018+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_appl_166.sdi to <STDOUT>
2025-07-28T01:01:34.443280+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_appl_166.sdi to <STDOUT>
2025-07-28T01:01:34.443630+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_123.sdi to <STDOUT>
2025-07-28T01:01:34.443926+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_123.sdi to <STDOUT>
2025-07-28T01:01:34.444240+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/memory_summary_b_157.sdi to <STDOUT>
2025-07-28T01:01:34.444494+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/memory_summary_b_157.sdi to <STDOUT>
2025-07-28T01:01:34.444780+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_transacti_135.sdi to <STDOUT>
2025-07-28T01:01:34.445070+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_transacti_135.sdi to <STDOUT>
2025-07-28T01:01:34.445388+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/setup_threads_106.sdi to <STDOUT>
2025-07-28T01:01:34.445629+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/setup_threads_106.sdi to <STDOUT>
2025-07-28T01:01:34.445919+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_stages_su_117.sdi to <STDOUT>
2025-07-28T01:01:34.446179+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_stages_su_117.sdi to <STDOUT>
2025-07-28T01:01:34.446476+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_appl_171.sdi to <STDOUT>
2025-07-28T01:01:34.446739+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_appl_171.sdi to <STDOUT>
2025-07-28T01:01:34.447038+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/accounts_145.sdi to <STDOUT>
2025-07-28T01:01:34.447294+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/accounts_145.sdi to <STDOUT>
2025-07-28T01:01:34.447742+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_appl_165.sdi to <STDOUT>
2025-07-28T01:01:34.447980+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_appl_165.sdi to <STDOUT>
2025-07-28T01:01:34.448279+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_appl_170.sdi to <STDOUT>
2025-07-28T01:01:34.448475+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_appl_170.sdi to <STDOUT>
2025-07-28T01:01:34.448754+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_124.sdi to <STDOUT>
2025-07-28T01:01:34.449040+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_124.sdi to <STDOUT>
2025-07-28T01:01:34.449343+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_conn_164.sdi to <STDOUT>
2025-07-28T01:01:34.449580+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_conn_164.sdi to <STDOUT>
2025-07-28T01:01:34.449872+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_transacti_133.sdi to <STDOUT>
2025-07-28T01:01:34.450332+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_transacti_133.sdi to <STDOUT>
2025-07-28T01:01:34.450692+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/error_log_83.sdi to <STDOUT>
2025-07-28T01:01:34.450941+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/error_log_83.sdi to <STDOUT>
2025-07-28T01:01:34.451327+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/hosts_146.sdi to <STDOUT>
2025-07-28T01:01:34.451544+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/hosts_146.sdi to <STDOUT>
2025-07-28T01:01:34.451888+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/status_by_user_180.sdi to <STDOUT>
2025-07-28T01:01:34.452099+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/status_by_user_180.sdi to <STDOUT>
2025-07-28T01:01:34.452432+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/cond_instances_82.sdi to <STDOUT>
2025-07-28T01:01:34.452650+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/cond_instances_82.sdi to <STDOUT>
2025-07-28T01:01:34.453101+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_stages_su_114.sdi to <STDOUT>
2025-07-28T01:01:34.453327+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_stages_su_114.sdi to <STDOUT>
2025-07-28T01:01:34.453724+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_transacti_136.sdi to <STDOUT>
2025-07-28T01:01:34.453998+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_transacti_136.sdi to <STDOUT>
2025-07-28T01:01:34.454522+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/session_variable_185.sdi to <STDOUT>
2025-07-28T01:01:34.454737+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/session_variable_185.sdi to <STDOUT>
2025-07-28T01:01:34.455085+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_appl_168.sdi to <STDOUT>
2025-07-28T01:01:34.455385+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_appl_168.sdi to <STDOUT>
2025-07-28T01:01:34.455755+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/status_by_host_178.sdi to <STDOUT>
2025-07-28T01:01:34.455950+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/status_by_host_178.sdi to <STDOUT>
2025-07-28T01:01:34.456297+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_transacti_137.sdi to <STDOUT>
2025-07-28T01:01:34.456516+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_transacti_137.sdi to <STDOUT>
2025-07-28T01:01:34.456813+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/users_144.sdi to <STDOUT>
2025-07-28T01:01:34.457018+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/users_144.sdi to <STDOUT>
2025-07-28T01:01:34.457330+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/user_variables_b_176.sdi to <STDOUT>
2025-07-28T01:01:34.457536+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/user_variables_b_176.sdi to <STDOUT>
2025-07-28T01:01:34.457814+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_waits_sum_90.sdi to <STDOUT>
2025-07-28T01:01:34.458045+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_waits_sum_90.sdi to <STDOUT>
2025-07-28T01:01:34.458339+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/data_lock_waits_161.sdi to <STDOUT>
2025-07-28T01:01:34.458670+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/data_lock_waits_161.sdi to <STDOUT>
2025-07-28T01:01:34.458956+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_121.sdi to <STDOUT>
2025-07-28T01:01:34.459290+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_121.sdi to <STDOUT>
2025-07-28T01:01:34.459588+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_waits_sum_87.sdi to <STDOUT>
2025-07-28T01:01:34.459798+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_waits_sum_87.sdi to <STDOUT>
2025-07-28T01:01:34.460095+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/persisted_variab_187.sdi to <STDOUT>
2025-07-28T01:01:34.460293+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/persisted_variab_187.sdi to <STDOUT>
2025-07-28T01:01:34.460568+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/objects_summary__98.sdi to <STDOUT>
2025-07-28T01:01:34.460826+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/objects_summary__98.sdi to <STDOUT>
2025-07-28T01:01:34.461131+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/setup_objects_105.sdi to <STDOUT>
2025-07-28T01:01:34.461369+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/setup_objects_105.sdi to <STDOUT>
2025-07-28T01:01:34.461652+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/log_status_174.sdi to <STDOUT>
2025-07-28T01:01:34.461953+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/log_status_174.sdi to <STDOUT>
2025-07-28T01:01:34.462318+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_waits_his_86.sdi to <STDOUT>
2025-07-28T01:01:34.462620+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_waits_his_86.sdi to <STDOUT>
2025-07-28T01:01:34.462943+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/mutex_instances_97.sdi to <STDOUT>
2025-07-28T01:01:34.463159+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/mutex_instances_97.sdi to <STDOUT>
2025-07-28T01:01:34.463444+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_stages_hi_113.sdi to <STDOUT>
2025-07-28T01:01:34.463728+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_stages_hi_113.sdi to <STDOUT>
2025-07-28T01:01:34.464094+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/variables_by_thr_183.sdi to <STDOUT>
2025-07-28T01:01:34.464277+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/variables_by_thr_183.sdi to <STDOUT>
2025-07-28T01:01:34.464582+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_transacti_138.sdi to <STDOUT>
2025-07-28T01:01:34.464845+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_transacti_138.sdi to <STDOUT>
2025-07-28T01:01:34.465137+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/prepared_stateme_175.sdi to <STDOUT>
2025-07-28T01:01:34.465443+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/prepared_stateme_175.sdi to <STDOUT>
2025-07-28T01:01:34.465747+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/setup_actors_102.sdi to <STDOUT>
2025-07-28T01:01:34.465980+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/setup_actors_102.sdi to <STDOUT>
2025-07-28T01:01:34.466280+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/file_summary_by__95.sdi to <STDOUT>
2025-07-28T01:01:34.466619+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/file_summary_by__95.sdi to <STDOUT>
2025-07-28T01:01:34.466906+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/memory_summary_g_153.sdi to <STDOUT>
2025-07-28T01:01:34.467155+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/memory_summary_g_153.sdi to <STDOUT>
2025-07-28T01:01:34.467431+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_conn_162.sdi to <STDOUT>
2025-07-28T01:01:34.467711+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_conn_162.sdi to <STDOUT>
2025-07-28T01:01:34.467998+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/binary_log_trans_189.sdi to <STDOUT>
2025-07-28T01:01:34.468259+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/binary_log_trans_189.sdi to <STDOUT>
2025-07-28T01:01:34.468665+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/session_account__151.sdi to <STDOUT>
2025-07-28T01:01:34.468924+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/session_account__151.sdi to <STDOUT>
2025-07-28T01:01:34.469286+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/table_io_waits_s_107.sdi to <STDOUT>
2025-07-28T01:01:34.469606+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/table_io_waits_s_107.sdi to <STDOUT>
2025-07-28T01:01:34.469908+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/processlist_100.sdi to <STDOUT>
2025-07-28T01:01:34.470167+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/processlist_100.sdi to <STDOUT>
2025-07-28T01:01:34.470453+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_appl_167.sdi to <STDOUT>
2025-07-28T01:01:34.470749+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_appl_167.sdi to <STDOUT>
2025-07-28T01:01:34.471099+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_waits_cur_84.sdi to <STDOUT>
2025-07-28T01:01:34.471397+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_waits_cur_84.sdi to <STDOUT>
2025-07-28T01:01:34.471868+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/table_handles_158.sdi to <STDOUT>
2025-07-28T01:01:34.472137+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/table_handles_158.sdi to <STDOUT>
2025-07-28T01:01:34.472594+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/performance_time_99.sdi to <STDOUT>
2025-07-28T01:01:34.472815+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/performance_time_99.sdi to <STDOUT>
2025-07-28T01:01:34.473226+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/status_by_thread_179.sdi to <STDOUT>
2025-07-28T01:01:34.473422+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/status_by_thread_179.sdi to <STDOUT>
2025-07-28T01:01:34.473722+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_grou_163.sdi to <STDOUT>
2025-07-28T01:01:34.473991+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_grou_163.sdi to <STDOUT>
2025-07-28T01:01:34.474274+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/memory_summary_b_154.sdi to <STDOUT>
2025-07-28T01:01:34.474637+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/memory_summary_b_154.sdi to <STDOUT>
2025-07-28T01:01:34.474980+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_errors_su_142.sdi to <STDOUT>
2025-07-28T01:01:34.475164+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_errors_su_142.sdi to <STDOUT>
2025-07-28T01:01:34.475455+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_120.sdi to <STDOUT>
2025-07-28T01:01:34.475776+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_120.sdi to <STDOUT>
2025-07-28T01:01:34.476084+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_130.sdi to <STDOUT>
2025-07-28T01:01:34.476304+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_130.sdi to <STDOUT>
2025-07-28T01:01:34.476606+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/file_instances_93.sdi to <STDOUT>
2025-07-28T01:01:34.476851+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/file_instances_93.sdi to <STDOUT>
2025-07-28T01:01:34.477140+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_waits_sum_88.sdi to <STDOUT>
2025-07-28T01:01:34.477352+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_waits_sum_88.sdi to <STDOUT>
2025-07-28T01:01:34.477650+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/session_connect__150.sdi to <STDOUT>
2025-07-28T01:01:34.477838+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/session_connect__150.sdi to <STDOUT>
2025-07-28T01:01:34.478119+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_asyn_172.sdi to <STDOUT>
2025-07-28T01:01:34.478443+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_asyn_172.sdi to <STDOUT>
2025-07-28T01:01:34.478774+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/replication_asyn_173.sdi to <STDOUT>
2025-07-28T01:01:34.478979+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/replication_asyn_173.sdi to <STDOUT>
2025-07-28T01:01:34.479257+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/setup_consumers_103.sdi to <STDOUT>
2025-07-28T01:01:34.479447+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/setup_consumers_103.sdi to <STDOUT>
2025-07-28T01:01:34.479716+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/global_status_181.sdi to <STDOUT>
2025-07-28T01:01:34.479894+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/global_status_181.sdi to <STDOUT>
2025-07-28T01:01:34.480185+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_125.sdi to <STDOUT>
2025-07-28T01:01:34.480477+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_125.sdi to <STDOUT>
2025-07-28T01:01:34.480883+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/socket_summary_b_148.sdi to <STDOUT>
2025-07-28T01:01:34.481156+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/socket_summary_b_148.sdi to <STDOUT>
2025-07-28T01:01:34.481590+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_119.sdi to <STDOUT>
2025-07-28T01:01:34.481927+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_119.sdi to <STDOUT>
2025-07-28T01:01:34.482227+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_waits_sum_91.sdi to <STDOUT>
2025-07-28T01:01:34.482521+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_waits_sum_91.sdi to <STDOUT>
2025-07-28T01:01:34.482813+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_stages_su_116.sdi to <STDOUT>
2025-07-28T01:01:34.483001+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_stages_su_116.sdi to <STDOUT>
2025-07-28T01:01:34.483304+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/file_summary_by__94.sdi to <STDOUT>
2025-07-28T01:01:34.483560+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/file_summary_by__94.sdi to <STDOUT>
2025-07-28T01:01:34.483859+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/threads_110.sdi to <STDOUT>
2025-07-28T01:01:34.484135+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/threads_110.sdi to <STDOUT>
2025-07-28T01:01:34.484435+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_stages_su_115.sdi to <STDOUT>
2025-07-28T01:01:34.484635+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_stages_su_115.sdi to <STDOUT>
2025-07-28T01:01:34.484912+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_stages_su_118.sdi to <STDOUT>
2025-07-28T01:01:34.485076+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_stages_su_118.sdi to <STDOUT>
2025-07-28T01:01:34.485382+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_waits_sum_89.sdi to <STDOUT>
2025-07-28T01:01:34.485567+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_waits_sum_89.sdi to <STDOUT>
2025-07-28T01:01:34.485842+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_transacti_134.sdi to <STDOUT>
2025-07-28T01:01:34.486114+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_transacti_134.sdi to <STDOUT>
2025-07-28T01:01:34.486403+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_transacti_132.sdi to <STDOUT>
2025-07-28T01:01:34.486702+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_transacti_132.sdi to <STDOUT>
2025-07-28T01:01:34.486987+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_127.sdi to <STDOUT>
2025-07-28T01:01:34.487266+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_127.sdi to <STDOUT>
2025-07-28T01:01:34.487752+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/metadata_locks_159.sdi to <STDOUT>
2025-07-28T01:01:34.488038+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/metadata_locks_159.sdi to <STDOUT>
2025-07-28T01:01:34.488369+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_errors_su_139.sdi to <STDOUT>
2025-07-28T01:01:34.488635+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_errors_su_139.sdi to <STDOUT>
2025-07-28T01:01:34.488997+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_statement_129.sdi to <STDOUT>
2025-07-28T01:01:34.489182+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_statement_129.sdi to <STDOUT>
2025-07-28T01:01:34.489609+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/user_defined_fun_188.sdi to <STDOUT>
2025-07-28T01:01:34.489867+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/user_defined_fun_188.sdi to <STDOUT>
2025-07-28T01:01:34.490174+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/memory_summary_b_156.sdi to <STDOUT>
2025-07-28T01:01:34.490419+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/memory_summary_b_156.sdi to <STDOUT>
2025-07-28T01:01:34.490708+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/events_errors_su_140.sdi to <STDOUT>
2025-07-28T01:01:34.490871+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/events_errors_su_140.sdi to <STDOUT>
2025-07-28T01:01:34.491186+03:00 3 [Note] [MY-011825] [Xtrabackup] Streaming performance_schema/host_cache_96.sdi to <STDOUT>
2025-07-28T01:01:34.491502+03:00 3 [Note] [MY-011825] [Xtrabackup] Done: Streaming performance_schema/host_cache_96.sdi to <STDOUT>
2025-07-28T01:01:34.517351+03:00 0 [Note] [MY-011825] [Xtrabackup] Finished backing up non-InnoDB tables and files
2025-07-28T01:01:34.517425+03:00 0 [Note] [MY-011825] [Xtrabackup] Executing FLUSH NO_WRITE_TO_BINLOG BINARY LOGS
2025-07-28T01:01:34.526925+03:00 0 [Note] [MY-011825] [Xtrabackup] Selecting LSN and binary log position from p_s.log_status
2025-07-28T01:01:34.529820+03:00 0 [Note] [MY-011825] [Xtrabackup] Streaming /var/lib/mysql/binlog.000018 to <STDOUT> up to position 157
2025-07-28T01:01:34.529870+03:00 0 [Note] [MY-011825] [Xtrabackup] Done: Streaming /var/lib/mysql/binlog.000018 to <STDOUT>
2025-07-28T01:01:34.530129+03:00 0 [Note] [MY-011825] [Xtrabackup] Streaming <STDOUT>
2025-07-28T01:01:34.530157+03:00 0 [Note] [MY-011825] [Xtrabackup] Done: Streaming file <STDOUT>
2025-07-28T01:01:34.539263+03:00 0 [Note] [MY-011825] [Xtrabackup] Streaming <STDOUT>
2025-07-28T01:01:34.539303+03:00 0 [Note] [MY-011825] [Xtrabackup] Done: Streaming file <STDOUT>
2025-07-28T01:01:34.539331+03:00 0 [Note] [MY-011825] [Xtrabackup] Executing FLUSH NO_WRITE_TO_BINLOG ENGINE LOGS...
2025-07-28T01:01:34.540618+03:00 0 [Note] [MY-011825] [Xtrabackup] The latest check point (for incremental): '20351037'
2025-07-28T01:01:34.540644+03:00 0 [Note] [MY-011825] [Xtrabackup] Stopping log copying thread at LSN 20351037
2025-07-28T01:01:34.540725+03:00 1 [Note] [MY-011825] [Xtrabackup] Starting to parse redo log at lsn = 20350999
2025-07-28T01:01:34.541652+03:00 0 [Note] [MY-011825] [Xtrabackup] Executing UNLOCK INSTANCE
2025-07-28T01:01:34.541793+03:00 0 [Note] [MY-011825] [Xtrabackup] All tables unlocked
2025-07-28T01:01:34.541944+03:00 0 [Note] [MY-011825] [Xtrabackup] Streaming ib_buffer_pool to <STDOUT>
2025-07-28T01:01:34.541984+03:00 0 [Note] [MY-011825] [Xtrabackup] Done: Streaming ib_buffer_pool to <STDOUT>
2025-07-28T01:01:34.543302+03:00 0 [Note] [MY-011825] [Xtrabackup] Backup created in directory '/tmp/backup/'
2025-07-28T01:01:34.543325+03:00 0 [Note] [MY-011825] [Xtrabackup] MySQL binlog position: filename 'binlog.000018', position '157'
2025-07-28T01:01:34.543359+03:00 0 [Note] [MY-011825] [Xtrabackup] Streaming <STDOUT>
2025-07-28T01:01:34.543378+03:00 0 [Note] [MY-011825] [Xtrabackup] Done: Streaming file <STDOUT>
2025-07-28T01:01:34.550797+03:00 0 [Note] [MY-011825] [Xtrabackup] Streaming <STDOUT>
2025-07-28T01:01:34.550837+03:00 0 [Note] [MY-011825] [Xtrabackup] Done: Streaming file <STDOUT>
2025-07-28T01:01:35.551253+03:00 0 [Note] [MY-011825] [Xtrabackup] Transaction log of lsn (20351037) to (20351037) was copied.
2025-07-28T01:01:35.767004+03:00 0 [Note] [MY-011825] [Xtrabackup] completed OK!
fislis@Matveev-victus:~/world-db-restore$ mysql -u root -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 12
Server version: 8.0.42-0ubuntu0.24.04.2 (Ubuntu)

Copyright (c) 2000, 2025, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> select 'city' as t_name, count() as cnt from city
ct 'city (RUS)',    -> union all select 'city (RUS)', count() from city where countrycode = 'RUS'
    -> union all select 'country', count() from country
ion all select '    -> union all select 'countrylanguage', count() from countrylanguage;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ') as cnt from city
union all select 'city (RUS)', count() from city where countr' at line 1
mysql> select 'city' as t_name, count(*) as cnt from city
, count(*) from     -> union all
    -> select 'city (RUS)', count(*) from city where countrycode = 'RUS'
    -> union all
    -> select 'country', count(*) from country
    -> union all
    -> select 'countrylanguage', count(*) from countrylanguage;
ERROR 1046 (3D000): No database selected
mysql> use world
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> select 'city' as t_name, count(*) as cnt from city
ect 'city (RUS)'    -> union all
, count(*) from     -> select 'city (RUS)', count(*) from city where countrycode = 'RUS'
    -> union all
    -> select 'country', count(*) from country
    -> union all
    -> select 'countrylanguage', count(*) from countrylanguage;
+-----------------+-----+
| t_name          | cnt |
+-----------------+-----+
| city            |   0 |
| city (RUS)      |   0 |
| country         |   0 |
| countrylanguage |   0 |
+-----------------+-----+
4 rows in set (0.00 sec)
