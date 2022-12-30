--comandos executados no utilitário rman (rman target /)

--lista todos as configurações
show all;

--mudando a política de retenção para dois dias (defaul é REDUNDANCY 1)
configure retention policy to recovery window of 2 days;

--alterar o destino dos backup (caso não queira usar a FRA)
configure channel device type disk format '/backup/pa6hom/%U';
