ָ����ɲ���

> ��log���

> ��дָ�������, ��plan_aoip_del�е�bsc_id, linkset...

> ����ָ����ͼ, ���ݹ��������� ��vnfr:
select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNFR:NA1,',`znsi`.`spc`,';') AS `cmd` 
from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in
 (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`)

> ��дcmds_route, ��ָ����ͼ���������

> ִ�д洢���� route2cmds, ָ���д��cmds�� 

> cmds������cvs, ��excel��ȡ


