SELECT OBJECT_NAME(object_id) AS [Table] ,
Last_user_update, Last_user_seek, Last_user_scan, Last_user_lookup
FROM sys.dm_db_index_usage_stats
WHERE database_id = DB_ID('dbstage')
GO