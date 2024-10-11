SELECT name, 
       type, 
       type_desc
FROM sys.system_objects so
WHERE so.name LIKE 'dm_%'
ORDER BY so.name;

SELECT TOP 100 *
FROM sys.dm_exec_connections


SELECT name, xtype, crdate FROM sysobjects WHERE xtype = 'P' ORDER BY crdate
SELECT name, xtype, crdate FROM sysobjects ORDER BY xtype, crdate
SELECT * FROM syscolumns WHERE ID=(select id from sysobjects where name='mapping_jabatan_final')
SELECT * FROM syscomments WHERE ID=(select id from sysobjects where name='spwPRACETAK_LAPORAN_KEUANGAN_PEGAWAI' and xtype='P')

SELECT name FROM syscolumns WHERE [status]=128 AND id=(select id from sysobjects where name='tm_pegawai')

/*
Execution

sys.dm_exec_connections = Established connection
sys.dm_exec_sessions = Authenticated sessions
sys.dm_exec_requests = Current requests

Execution (query related)

sys.dm_exec_cached_plans = Cached execution plans
sys.dm_exec_query_plan = Show plan for a given cached plan_handle
sys.dm_exec_query_stats = Query performance stats
sys.dm_exec_sql_text = SQL text given a sql_handle

Index

sys.dm_db_index_physical_stats = Index size and fragmentation
sys.dm_db_index_usage_stats = index usage via the query optimizer
sys.dm_db_missing_index_details = Discover missing indexes

OS

sys.dm_os_performance_counters = List of all SQL Server performance counters and values
sys.dm_os_schedulers = Detect CPU pressure
sys.dm_os_waiting_tasks = Tasks waiting on resources
sys.dm_os_wait_stats = All waits types and stats

I/O

sys.dm_io_virtual_file_stats = I/O stats for data and log files
sys.dm_io_pending_io_requests = Pending I/O requests

CLR

sys.dm_clr_loaded_assemblies = Loaded assemblies
sys.dm_clr_tasks = CLR related tasks
*/
