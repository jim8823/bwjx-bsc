指令集生成步骤

> 读log入库

> 填写指令过滤器, 如plan_aoip_del中的bsc_id, linkset...

> 制作指令视图, 根据过滤器过滤 如vnfr:
select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNFR:NA1,',`znsi`.`spc`,';') AS `cmd` 
from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in
 (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`)

> 填写cmds_route, 即指令视图名及次序号

> 执行存储过程 route2cmds, 指令将填写到cmds中 

> cmds导出到cvs, 用excel读取


