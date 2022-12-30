--backup do banco, com possibildiade de tornar um backup incremental
backup incremental level 0 database;

--apagando todos os backup que estão foram da janela de retenção
delete noprompt obsolete;

--versão em texto caso precise recriar os controfile!!!
sql "alter database backup controlfile to trace as /backup/pa6hom/controlfile.txt"

--verificando se todos os arquvuos do banco possuem backup
report need backup;