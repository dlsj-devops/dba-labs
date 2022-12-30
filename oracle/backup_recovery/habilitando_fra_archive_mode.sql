--consultando os parâmetros da FRA
set line 250;

show parameter db_recovery_file_dest;

--configurar na sequencia

--primeiro db_recovery_file_dest_size
alter system set db_recovery_file_dest_size=50G scope=BOTH;

--segundo db_recovery_file_dest
alter system set db_recovery_file_dest = '/backup/pa6hom/fra' scope=both;

--configurando o flashback log e o tempo de retenção

select flashback_on from v$database; --veio NO

alter database flashback on;

--gerou os erros:
--ORA-38706: Cannot turn on FLASHBACK DATABASE logging.
--ORA-38707: Media recovery is not enabled (banco não está em archive log)

--verifique se o banco está com archive log habilitado
archive log list; --retorna No Archive Mode

shutdown immediate;

startup mount;

alter database archivelog;

alter database open;

archive log list; --retorna Archive Mode

--alter system log_archive_dest_1 = 'location = /backup/pa6hom/archivelog'

--tentar novamente
alter database flashback on;

--tempo de retenção
alter system set db_flashback_retention_target=1440 scope=both;

--consultando as informações da FRA

select * from v$flashback_database_log; 

select * from v$recovery_area_usage; --uso para cada tipo de arquivo

select * from v$recovery_file_dest; --visão geral de uso