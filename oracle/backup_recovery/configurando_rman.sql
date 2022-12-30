--comandos executados no utilitário rman (rman target /)

--lista todos as configurações
show all;

--mudando a política de retenção para dois dias (defaul é REDUNDANCY 1)
configure retention policy to recovery window of 2 days;

--com a janela de dois dias, caso execute o comando abaixo, todos os obsoletos, fora da janela de retenção,s erão apagados:
delete noprompt obsolete;

--alterar o destino dos backup (caso não queira usar a FRA)
configure channel device type disk format '/backup/pa6hom/%U';
