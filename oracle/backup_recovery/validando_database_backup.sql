
 --validando o banco de dados.
 --será checado cada datafile das tabespaces do banco
 validate database;
 
 --validando um backup
 backup database validate;

 --validando se p backup está integrando para ser restaurado
 restore database validate;