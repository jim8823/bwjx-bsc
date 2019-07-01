-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2019 年 02 月 14 日 02:25
-- 服务器版本: 5.6.12-log
-- PHP 版本: 5.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `bwjx-bsc_aoip`
--
CREATE DATABASE IF NOT EXISTS `bwjx-bsc_aoip` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `bwjx-bsc_aoip`;

DELIMITER $$
--
-- 存储过程
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `route2cmds`(IN `_cmd_type` VARCHAR(30))
    NO SQL
begin
declare _id int;
##declare _newid int;
declare _vcmd varchar(30);
declare _cmd varchar(30);
declare _cur cursor for SELECT id, cmds FROM cmds_route WHERE cmd_type = _cmd_type  ORDER BY ord;
declare continue handler for not found set _id=null;
open _cur;
fetch _cur into _id, _vcmd;
##select _id, _vcmd;
##set _newid = 0;
truncate table cmds;
while (_id is not null) do
   set @sqlstr = concat('insert into cmds (bsc_id,cmd) select bsc_id,cmd from ', _vcmd);
   prepare stmt from @sqlstr;
   execute stmt;
   ##set _newid = _newid + 1;
   fetch next from _cur into _id, _vcmd;
end while;
close _cur;
end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- 表的结构 `cmds`
--

CREATE TABLE IF NOT EXISTS `cmds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmd` varchar(150) NOT NULL,
  `bsc_id` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=133 ;

--
-- 转存表中的数据 `cmds`
--

INSERT INTO `cmds` (`id`, `cmd`, `bsc_id`) VALUES
(1, 'ZNHC:NA1,02E2:FE:INA;', 'R0831'),
(2, 'ZNHC:NA1,02E2:FE:INA;', 'R0835'),
(3, 'ZNHC:NA1,02E2:FE:INA;', 'R1031'),
(4, 'ZNHC:NA1,02E2:FE:INA;', 'R1035'),
(5, 'ZNHC:NA1,02E2:FE:INA;', 'R4234'),
(6, 'ZNHC:NA1,02E2:FE:INA;', 'R5433'),
(8, 'ZNGC:NA1,02E2:INA;', 'R0831'),
(9, 'ZNGC:NA1,02E2:INA;', 'R0835'),
(10, 'ZNGC:NA1,02E2:INA;', 'R1031'),
(11, 'ZNGC:NA1,02E2:INA;', 'R1035'),
(12, 'ZNGC:NA1,02E2:INA;', 'R4234'),
(13, 'ZNGC:NA1,02E2:INA;', 'R5433'),
(15, 'ZNVC:NA1,02E2:NA1,02E2:INA;', 'R0831'),
(16, 'ZNVC:NA1,02E2:NA1,02E2:INA;', 'R0835'),
(17, 'ZNVC:NA1,02E2:NA1,02E2:INA;', 'R1031'),
(18, 'ZNVC:NA1,02E2:NA1,02E2:INA;', 'R1035'),
(19, 'ZNVC:NA1,02E2:NA1,02E2:INA;', 'R4234'),
(20, 'ZNVC:NA1,02E2:NA1,02E2:INA;', 'R5433'),
(22, 'ZNVD:NA1,02E2:NA1,02E2;', 'R0831'),
(23, 'ZNVD:NA1,02E2:NA1,02E2;', 'R0835'),
(24, 'ZNVD:NA1,02E2:NA1,02E2;', 'R1031'),
(25, 'ZNVD:NA1,02E2:NA1,02E2;', 'R1035'),
(26, 'ZNVD:NA1,02E2:NA1,02E2;', 'R4234'),
(27, 'ZNVD:NA1,02E2:NA1,02E2;', 'R5433'),
(29, 'ZNLC:42,INA;', 'R0831'),
(30, 'ZNLC:42,INA;', 'R0835'),
(31, 'ZNLC:41,INA;', 'R1031'),
(32, 'ZNLC:41,INA;', 'R1035'),
(33, 'ZNLC:43,INA;', 'R4234'),
(34, 'ZNLC:44,INA;', 'R5433'),
(36, 'ZNLD:42;', 'R0831'),
(37, 'ZNLD:42;', 'R0835'),
(38, 'ZNLD:41;', 'R1031'),
(39, 'ZNLD:41;', 'R1035'),
(40, 'ZNLD:43;', 'R4234'),
(41, 'ZNLD:44;', 'R5433'),
(43, 'ZOYS:M3UA:BGS10,0:INA;', 'R0831'),
(44, 'ZOYS:M3UA:BGS10,1:INA;', 'R0831'),
(45, 'ZOYS:M3UA:BGS10,2:INA;', 'R0831'),
(46, 'ZOYS:M3UA:BGS10,3:INA;', 'R0831'),
(47, 'ZOYS:M3UA:BGS10,0:INA;', 'R0835'),
(48, 'ZOYS:M3UA:BGS10,1:INA;', 'R0835'),
(49, 'ZOYS:M3UA:BGS10,2:INA;', 'R0835'),
(50, 'ZOYS:M3UA:BGS10,3:INA;', 'R0835'),
(51, 'ZOYS:M3UA:BGS10,0:INA;', 'R1031'),
(52, 'ZOYS:M3UA:BGS10,1:INA;', 'R1031'),
(53, 'ZOYS:M3UA:BGS10,2:INA;', 'R1031'),
(54, 'ZOYS:M3UA:BGS10,3:INA;', 'R1031'),
(55, 'ZOYS:M3UA:BGS10,0:INA;', 'R1035'),
(56, 'ZOYS:M3UA:BGS10,1:INA;', 'R1035'),
(57, 'ZOYS:M3UA:BGS10,2:INA;', 'R1035'),
(58, 'ZOYS:M3UA:BGS10,3:INA;', 'R1035'),
(59, 'ZOYS:M3UA:BGS10,0:INA;', 'R4234'),
(60, 'ZOYS:M3UA:BGS10,1:INA;', 'R4234'),
(61, 'ZOYS:M3UA:BGS10,2:INA;', 'R4234'),
(62, 'ZOYS:M3UA:BGS10,3:INA;', 'R4234'),
(63, 'ZOYS:M3UA:BGS10,0:INA;', 'R5433'),
(64, 'ZOYS:M3UA:BGS10,1:INA;', 'R5433'),
(65, 'ZOYS:M3UA:BGS10,2:INA;', 'R5433'),
(66, 'ZOYS:M3UA:BGS10,3:INA;', 'R5433'),
(74, 'ZNFR:NA1,02E2;', 'R0831'),
(75, 'ZNFR:NA1,02E2;', 'R0835'),
(76, 'ZNFR:NA1,02E2;', 'R1031'),
(77, 'ZNFR:NA1,02E2;', 'R1035'),
(78, 'ZNFR:NA1,02E2;', 'R4234'),
(79, 'ZNFR:NA1,02E2;', 'R5433'),
(81, 'ZNRR:NA1,02E2:NA1,02E2;', 'R0831'),
(82, 'ZNRR:NA1,02E2:NA1,02E2;', 'R0835'),
(83, 'ZNRR:NA1,02E2:NA1,02E2;', 'R1031'),
(84, 'ZNRR:NA1,02E2:NA1,02E2;', 'R1035'),
(85, 'ZNRR:NA1,02E2:NA1,02E2;', 'R4234'),
(86, 'ZNRR:NA1,02E2:NA1,02E2;', 'R5433'),
(88, 'ZNSR:NA1,02E2,BGS10:42;', 'R0831'),
(89, 'ZNSR:NA1,02E2,BGS10:42;', 'R0835'),
(90, 'ZNSR:NA1,02E2,BGS10:41;', 'R1031'),
(91, 'ZNSR:NA1,02E2,BGS10:41;', 'R1035'),
(92, 'ZNSR:NA1,02E2,BGS10:43;', 'R4234'),
(93, 'ZNSR:NA1,02E2,BGS10:44;', 'R5433'),
(95, 'ZOYR:BGS10:0;', 'R0831'),
(96, 'ZOYR:BGS10:1;', 'R0831'),
(97, 'ZOYR:BGS10:2;', 'R0831'),
(98, 'ZOYR:BGS10:3;', 'R0831'),
(99, 'ZOYR:BGS10:0;', 'R0835'),
(100, 'ZOYR:BGS10:1;', 'R0835'),
(101, 'ZOYR:BGS10:2;', 'R0835'),
(102, 'ZOYR:BGS10:3;', 'R0835'),
(103, 'ZOYR:BGS10:0;', 'R1031'),
(104, 'ZOYR:BGS10:1;', 'R1031'),
(105, 'ZOYR:BGS10:2;', 'R1031'),
(106, 'ZOYR:BGS10:3;', 'R1031'),
(107, 'ZOYR:BGS10:0;', 'R1035'),
(108, 'ZOYR:BGS10:1;', 'R1035'),
(109, 'ZOYR:BGS10:2;', 'R1035'),
(110, 'ZOYR:BGS10:3;', 'R1035'),
(111, 'ZOYR:BGS10:0;', 'R4234'),
(112, 'ZOYR:BGS10:1;', 'R4234'),
(113, 'ZOYR:BGS10:2;', 'R4234'),
(114, 'ZOYR:BGS10:3;', 'R4234'),
(115, 'ZOYR:BGS10:0;', 'R5433'),
(116, 'ZOYR:BGS10:1;', 'R5433'),
(117, 'ZOYR:BGS10:2;', 'R5433'),
(118, 'ZOYR:BGS10:3;', 'R5433'),
(126, 'ZOYD:BGS10;', 'R0831'),
(127, 'ZOYD:BGS10;', 'R0835'),
(128, 'ZOYD:BGS10;', 'R1031'),
(129, 'ZOYD:BGS10;', 'R1035'),
(130, 'ZOYD:BGS10;', 'R4234'),
(131, 'ZOYD:BGS10;', 'R5433');

-- --------------------------------------------------------

--
-- 表的结构 `cmds_route`
--

CREATE TABLE IF NOT EXISTS `cmds_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cmd_type` varchar(30) NOT NULL,
  `cmds` varchar(30) NOT NULL,
  `ord` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=29 ;

--
-- 转存表中的数据 `cmds_route`
--

INSERT INTO `cmds_route` (`id`, `cmd_type`, `cmds`, `ord`) VALUES
(1, 'aoip_del', 'vnhc_ina', 5),
(2, 'aoip_del', 'vngc_ina', 15),
(3, 'aoip_del', 'vnvc_ina', 30),
(4, 'aoip_del', 'vnvd', 40),
(5, 'aoip_del', 'vnlc_ina', 48),
(6, 'aoip_del', 'vnld', 55),
(7, 'aoip_del', 'voys_ina', 66),
(9, 'aoip_del', 'vnfr', 70),
(10, 'aoip_del', 'vnrr', 75),
(11, 'aoip_del', 'vnsr', 88),
(12, 'aoip_del', 'voyr', 93),
(13, 'aoip_del', 'voyd', 98),
(14, 'aoip_create', 'vzoyc', 5),
(15, 'aoip_create', 'vzoym', 10),
(16, 'aoip_create', 'vzoya', 15),
(17, 'aoip_create', 'vzoyp', 20),
(18, 'aoip_create', 'vznsp', 25),
(19, 'aoip_create', 'vznra', 30),
(20, 'aoip_create', 'vznrb', 35),
(21, 'aoip_create', 'vznfd', 40),
(22, 'aoip_create', 'vzoys_act', 50),
(23, 'aoip_create', 'vznla', 55),
(24, 'aoip_create', 'vznlc_act', 60),
(25, 'aoip_create', 'vznva', 65),
(26, 'aoip_create', 'vznvc_act', 70),
(27, 'aoip_create', 'vzngc_act', 75),
(28, 'aoip_create', 'vznhc_act', 80);

-- --------------------------------------------------------

--
-- 表的结构 `flagdata`
--

CREATE TABLE IF NOT EXISTS `flagdata` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(15) DEFAULT NULL,
  `extInfo` char(3) DEFAULT NULL,
  `flagFrom` int(3) DEFAULT NULL,
  `flagLen` int(3) DEFAULT NULL,
  `flag` varchar(60) DEFAULT NULL,
  `again` int(3) DEFAULT '1',
  `nextFld` int(3) DEFAULT '0',
  `fldName` varchar(15) DEFAULT NULL,
  `dataFrom` int(3) DEFAULT '0',
  `dataLen` int(3) DEFAULT '0',
  `dataValue` varchar(20) DEFAULT NULL,
  `dataCvtBy` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=31 ;

--
-- 转存表中的数据 `flagdata`
--

INSERT INTO `flagdata` (`id`, `tableName`, `extInfo`, `flagFrom`, `flagLen`, `flag`, `again`, `nextFld`, `fldName`, `dataFrom`, `dataLen`, `dataValue`, `dataCvtBy`) VALUES
(1, 'ZOYI', 'M', 0, 0, 'ASSOCIATION SET NAME   ASSOC SET ID   SCTP USER   ROLE', 0, 0, '', 0, 0, NULL, ''),
(2, 'ZOYI', '', 39, 8, 'M3UA    ', 1, 0, 'set_name', 1, 10, NULL, ''),
(3, 'ZOYI', 'V', 5, 26, 'ASSOC.         ASSOC ID  P', 0, 0, 'bsc_id', 1, 1, NULL, ''),
(5, 'ZOYI', '', 12, 5, 'BCSU-', 1, 0, 'id', 6, 2, NULL, ''),
(6, 'ZOYI', '', 12, 5, 'BCSU-', 0, 0, 'bcsu', 17, 2, NULL, ''),
(7, 'ZOYI', '', 9, 18, 'SOURCE ADDRESS 1 .', 0, 0, 'sou_el0', 38, 16, NULL, ''),
(8, 'ZOYI', '', 9, 18, 'SOURCE ADDRESS 2 .', 0, 0, 'sou_el1', 38, 26, NULL, ''),
(9, 'ZOYI', '', 9, 18, 'PRIMARY DEST. ADDR', 0, 0, 'tar_el0', 38, 30, NULL, ''),
(10, 'ZOYI', 'S', 9, 18, 'SECONDARY DEST. AD', 0, 0, 'tar_el1', 38, 30, NULL, ''),
(13, 'VARS', 'M', 1, 20, 'CON  TYPE     SW  C-', 0, 0, '', 0, 0, NULL, ''),
(14, 'VARS', 'VE', 1, 10, '000  BSC  ', 0, 0, 'bsc_id', 31, 11, NULL, ''),
(19, 'ZOYI', 'E', 1, 16, 'COMMAND EXECUTED', 0, 0, '', 0, 0, NULL, ''),
(25, 'ZNSI', 'MV', 1, 25, 'NET SP CODE H/D        LI', 0, 0, 'bsc_id', 1, 1, NULL, ''),
(26, 'ZNSI', '', 1, 4, 'NA1 ', 1, 0, 'spc', 7, 4, NULL, ''),
(27, 'ZNSI', '', 1, 4, 'NA1 ', 1, 0, 'linkset', 29, 10, NULL, ''),
(28, 'ZNSI', 'S', 1, 4, 'NA1 ', 0, 0, 'sln', 75, 3, NULL, ''),
(29, 'ZNSI', 'E', 1, 16, 'COMMAND EXECUTED', 0, 0, '', 0, 0, NULL, ''),
(30, 'ZOYI', NULL, 39, 8, 'M3UA    ', 0, 0, 'set_id', 34, 2, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `plan_aoip_del`
--

CREATE TABLE IF NOT EXISTS `plan_aoip_del` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bsc_id` varchar(15) NOT NULL,
  `linkset` varchar(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `plan_aoip_del`
--

INSERT INTO `plan_aoip_del` (`id`, `bsc_id`, `linkset`) VALUES
(2, 'R5433', 'BGS10'),
(3, 'R0831', 'BGS10'),
(4, 'R1031', 'BGS10'),
(5, 'R0835', 'BGS10'),
(6, 'R4234', 'BGS10'),
(42, 'R1035', 'BGS10');

-- --------------------------------------------------------

--
-- 表的结构 `sqlcmd`
--

CREATE TABLE IF NOT EXISTS `sqlcmd` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tableName` varchar(15) NOT NULL,
  `sqlCmd` text NOT NULL,
  `taxonamy` varchar(10) NOT NULL DEFAULT 'insert',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `sqlcmd`
--

INSERT INTO `sqlcmd` (`id`, `tableName`, `sqlCmd`, `taxonamy`) VALUES
(3, 'zoyi', 'insert into ZOYI (\r\nbsc_id,\r\n\r\nset_name,\r\nset_id,\r\n\r\n\r\n\r\nid,\r\nbcsu,\r\n\r\nsou_el0,\r\nsou_el1,\r\n\r\ntar_el0,\r\ntar_el1) values (\r\n:bsc_id,\r\n\r\n:set_name,\r\n:set_id,\r\n\r\n\r\n\r\n:id,\r\n:bcsu,\r\n\r\n:sou_el0,\r\n:sou_el1,\r\n\r\n:tar_el0,\r\n:tar_el1)\r\n', 'insert'),
(4, 'ZNSI', 'insert into ZNSI (\r\nbsc_id,\r\n\r\nspc,\r\nlinkset,\r\nsln\r\n) values (\r\n:bsc_id,\r\n\r\n:spc,\r\n:linkset,\r\n:sln)\r\n', 'insert');

-- --------------------------------------------------------

--
-- 替换视图以便查看 `vnfr`
--
CREATE TABLE IF NOT EXISTS `vnfr` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(14)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vngc_ina`
--
CREATE TABLE IF NOT EXISTS `vngc_ina` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(18)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vnhc_ina`
--
CREATE TABLE IF NOT EXISTS `vnhc_ina` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(21)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vnlc_ina`
--
CREATE TABLE IF NOT EXISTS `vnlc_ina` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(14)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vnld`
--
CREATE TABLE IF NOT EXISTS `vnld` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(10)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vnrr`
--
CREATE TABLE IF NOT EXISTS `vnrr` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(23)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vnsr`
--
CREATE TABLE IF NOT EXISTS `vnsr` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(30)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vnvc_ina`
--
CREATE TABLE IF NOT EXISTS `vnvc_ina` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(27)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vnvd`
--
CREATE TABLE IF NOT EXISTS `vnvd` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(23)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `voyd`
--
CREATE TABLE IF NOT EXISTS `voyd` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(16)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `voyr`
--
CREATE TABLE IF NOT EXISTS `voyr` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(19)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `voys_ina`
--
CREATE TABLE IF NOT EXISTS `voys_ina` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(28)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vznfd`
--
CREATE TABLE IF NOT EXISTS `vznfd` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(28)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vzngc_act`
--
CREATE TABLE IF NOT EXISTS `vzngc_act` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(18)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vznhc_act`
--
CREATE TABLE IF NOT EXISTS `vznhc_act` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(21)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vznla`
--
CREATE TABLE IF NOT EXISTS `vznla` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(10)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vznlc_act`
--
CREATE TABLE IF NOT EXISTS `vznlc_act` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(14)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vznra`
--
CREATE TABLE IF NOT EXISTS `vznra` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(47)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vznrb`
--
CREATE TABLE IF NOT EXISTS `vznrb` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(21)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vznsp`
--
CREATE TABLE IF NOT EXISTS `vznsp` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(41)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vznva`
--
CREATE TABLE IF NOT EXISTS `vznva` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(23)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vznvc_act`
--
CREATE TABLE IF NOT EXISTS `vznvc_act` (
`bsc_id` varchar(11)
,`linkset` varchar(10)
,`cmd` varchar(27)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vzoya`
--
CREATE TABLE IF NOT EXISTS `vzoya` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(29)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vzoyc`
--
CREATE TABLE IF NOT EXISTS `vzoyc` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(23)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vzoym`
--
CREATE TABLE IF NOT EXISTS `vzoym` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(21)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vzoyp`
--
CREATE TABLE IF NOT EXISTS `vzoyp` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(143)
);
-- --------------------------------------------------------

--
-- 替换视图以便查看 `vzoys_act`
--
CREATE TABLE IF NOT EXISTS `vzoys_act` (
`bsc_id` varchar(11)
,`set_name` varchar(10)
,`cmd` varchar(28)
);
-- --------------------------------------------------------

--
-- 表的结构 `znsi`
--

CREATE TABLE IF NOT EXISTS `znsi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bsc_id` varchar(11) DEFAULT NULL,
  `spc` varchar(4) DEFAULT NULL,
  `linkset` varchar(10) DEFAULT NULL,
  `sln` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `znsi`
--

INSERT INTO `znsi` (`id`, `bsc_id`, `spc`, `linkset`, `sln`) VALUES
(1, 'R0831', '02C2', 'BGS08', '41'),
(2, 'R0831', '02E2', 'BGS10', '42'),
(3, 'R0831', '04E2', 'BGS42', '43'),
(4, 'R0831', '05A2', 'BGS54', '44'),
(5, 'R0835', '02C2', 'BGS08', '41'),
(6, 'R0835', '02E2', 'BGS10', '42'),
(7, 'R0835', '04E2', 'BGS42', '43'),
(8, 'R0835', '05A2', 'BGS54', '44'),
(9, 'R1031', '02C2', 'BGS08', '42'),
(10, 'R1031', '02E2', 'BGS10', '41'),
(11, 'R1031', '04E2', 'BGS42', '43'),
(12, 'R1031', '05A2', 'BGS54', '44'),
(13, 'R1035', '02C2', 'BGS08', '42'),
(14, 'R1035', '02E2', 'BGS10', '41'),
(15, 'R1035', '04E2', 'BGS42', '43'),
(16, 'R1035', '05A2', 'BGS54', '44'),
(17, 'R4234', '02C2', 'BGS08', '42'),
(18, 'R4234', '02E2', 'BGS10', '43'),
(19, 'R4234', '04E2', 'BGS42', '41'),
(20, 'R4234', '05A2', 'BGS54', '44'),
(21, 'R5433', '02C2', 'BGS08', '42'),
(22, 'R5433', '02E2', 'BGS10', '44'),
(23, 'R5433', '04E2', 'BGS42', '43'),
(24, 'R5433', '05A2', 'BGS54', '41');

-- --------------------------------------------------------

--
-- 表的结构 `zoyi`
--

CREATE TABLE IF NOT EXISTS `zoyi` (
  `set_name` varchar(10) NOT NULL DEFAULT '',
  `set_id` varchar(2) NOT NULL,
  `bsc_id` varchar(11) NOT NULL DEFAULT '',
  `id` varchar(2) NOT NULL DEFAULT '',
  `bcsu` varchar(2) DEFAULT NULL,
  `sou_el0` varchar(16) DEFAULT NULL,
  `sou_el1` varchar(26) DEFAULT NULL,
  `tar_el0` varchar(30) DEFAULT NULL,
  `tar_el1` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`set_name`,`bsc_id`,`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `zoyi`
--

INSERT INTO `zoyi` (`set_name`, `set_id`, `bsc_id`, `id`, `bcsu`, `sou_el0`, `sou_el1`, `tar_el0`, `tar_el1`) VALUES
('BGS08', '0', 'R0831', '0', '1', '10.111.104.2', '10.111.104.130', '10.111.132.132/27', '10.111.132.164/27'),
('BGS08', '0', 'R0831', '1', '2', '10.111.104.3', '10.111.104.131', '10.111.132.133/27', '10.111.132.165/27'),
('BGS08', '0', 'R0831', '2', '3', '10.111.104.4', '10.111.104.132', '10.111.132.134/27', '10.111.132.166/27'),
('BGS08', '0', 'R0831', '3', '4', '10.111.104.5', '10.111.104.133', '10.111.132.135/27', '10.111.132.167/27'),
('BGS08', '0', 'R0835', '0', '0', '10.111.104.66', '10.111.104.194', '10.111.132.133/27', '10.111.132.165/27'),
('BGS08', '0', 'R0835', '1', '3', '10.111.104.67', '10.111.104.195', '10.111.132.134/27', '10.111.132.166/27'),
('BGS08', '0', 'R0835', '2', '1', '10.111.104.68', '10.111.104.196', '10.111.132.135/27', '10.111.132.167/27'),
('BGS08', '0', 'R0835', '3', '2', '10.111.104.69', '10.111.104.197', '10.111.132.136/27', '10.111.132.168/27'),
('BGS08', '1', 'R1031', '0', '4', '10.111.101.2', '10.111.101.130', '10.111.132.143/27', '10.111.132.175/27'),
('BGS08', '1', 'R1031', '1', '0', '10.111.101.3', '10.111.101.131', '10.111.132.144/27', '10.111.132.176/27'),
('BGS08', '1', 'R1031', '2', '1', '10.111.101.4', '10.111.101.132', '10.111.132.145/27', '10.111.132.177/27'),
('BGS08', '1', 'R1031', '3', '2', '10.111.101.5', '10.111.101.133', '10.111.132.146/27', '10.111.132.178/27'),
('BGS08', '1', 'R1035', '0', '1', '10.111.101.66', '10.111.101.194', '10.111.132.144/27', '10.111.132.176/27'),
('BGS08', '1', 'R1035', '1', '2', '10.111.101.67', '10.111.101.195', '10.111.132.145/27', '10.111.132.177/27'),
('BGS08', '1', 'R1035', '2', '4', '10.111.101.68', '10.111.101.196', '10.111.132.146/27', '10.111.132.178/27'),
('BGS08', '1', 'R1035', '3', '0', '10.111.101.69', '10.111.101.197', '10.111.132.147/27', '10.111.132.179/27'),
('BGS08', '1', 'R4234', '0', '0', '10.111.102.50', '10.111.102.178', '10.111.132.132/27', '10.111.132.164/27'),
('BGS08', '1', 'R4234', '1', '3', '10.111.102.51', '10.111.102.179', '10.111.132.133/27', '10.111.132.165/27'),
('BGS08', '1', 'R4234', '2', '1', '10.111.102.52', '10.111.102.180', '10.111.132.134/27', '10.111.132.166/27'),
('BGS08', '1', 'R4234', '3', '2', '10.111.102.53', '10.111.102.181', '10.111.132.135/27', '10.111.132.167/27'),
('BGS08', '1', 'R5433', '0', '3', '10.111.103.34', '10.111.103.162', '10.111.132.137/27', '10.111.132.169/27'),
('BGS08', '1', 'R5433', '1', '1', '10.111.103.35', '10.111.103.163', '10.111.132.138/27', '10.111.132.170/27'),
('BGS08', '1', 'R5433', '2', '4', '10.111.103.36', '10.111.103.164', '10.111.132.139/27', '10.111.132.171/27'),
('BGS08', '1', 'R5433', '3', '2', '10.111.103.37', '10.111.103.165', '10.111.132.140/27', '10.111.132.172/27'),
('BGS10', '1', 'R0831', '0', '1', '10.111.104.2', '10.111.104.130', '10.111.136.132/27', '10.111.136.164/27'),
('BGS10', '1', 'R0831', '1', '2', '10.111.104.3', '10.111.104.131', '10.111.136.134/27', '10.111.136.166/27'),
('BGS10', '1', 'R0831', '2', '3', '10.111.104.4', '10.111.104.132', '10.111.136.135/27', '10.111.136.167/27'),
('BGS10', '1', 'R0831', '3', '4', '10.111.104.5', '10.111.104.133', '10.111.136.136/27', '10.111.136.168/27'),
('BGS10', '1', 'R0835', '0', '0', '10.111.104.66', '10.111.104.194', '10.111.136.132/27', '10.111.136.164/27'),
('BGS10', '1', 'R0835', '1', '3', '10.111.104.67', '10.111.104.195', '10.111.136.134/27', '10.111.136.166/27'),
('BGS10', '1', 'R0835', '2', '1', '10.111.104.68', '10.111.104.196', '10.111.136.135/27', '10.111.136.167/27'),
('BGS10', '1', 'R0835', '3', '2', '10.111.104.69', '10.111.104.197', '10.111.136.136/27', '10.111.136.168/27'),
('BGS10', '0', 'R1031', '0', '4', '10.111.101.2', '10.111.101.130', '10.111.136.132/27', '10.111.136.164/27'),
('BGS10', '0', 'R1031', '1', '0', '10.111.101.3', '10.111.101.131', '10.111.136.133/27', '10.111.136.165/27'),
('BGS10', '0', 'R1031', '2', '1', '10.111.101.4', '10.111.101.132', '10.111.136.134/27', '10.111.136.166/27'),
('BGS10', '0', 'R1031', '3', '2', '10.111.101.5', '10.111.101.133', '10.111.136.135/27', '10.111.136.167/27'),
('BGS10', '0', 'R1035', '0', '1', '10.111.101.66', '10.111.101.194', '10.111.136.133/27', '10.111.136.165/27'),
('BGS10', '0', 'R1035', '1', '2', '10.111.101.67', '10.111.101.195', '10.111.136.134/27', '10.111.136.166/27'),
('BGS10', '0', 'R1035', '2', '4', '10.111.101.68', '10.111.101.196', '10.111.136.135/27', '10.111.136.167/27'),
('BGS10', '0', 'R1035', '3', '0', '10.111.101.69', '10.111.101.197', '10.111.136.136/27', '10.111.136.168/27'),
('BGS10', '2', 'R4234', '0', '0', '10.111.102.50', '10.111.102.178', '10.111.136.147/27', '10.111.136.179/27'),
('BGS10', '2', 'R4234', '1', '3', '10.111.102.51', '10.111.102.179', '10.111.136.132/27', '10.111.136.164/27'),
('BGS10', '2', 'R4234', '2', '1', '10.111.102.52', '10.111.102.180', '10.111.136.133/27', '10.111.136.165/27'),
('BGS10', '2', 'R4234', '3', '2', '10.111.102.53', '10.111.102.181', '10.111.136.134/27', '10.111.136.166/27'),
('BGS10', '2', 'R5433', '0', '3', '10.111.103.34', '10.111.103.162', '10.111.136.132/27', '10.111.136.164/27'),
('BGS10', '2', 'R5433', '1', '1', '10.111.103.35', '10.111.103.163', '10.111.136.134/27', '10.111.136.166/27'),
('BGS10', '2', 'R5433', '2', '4', '10.111.103.36', '10.111.103.164', '10.111.136.135/27', '10.111.136.167/27'),
('BGS10', '2', 'R5433', '3', '2', '10.111.103.37', '10.111.103.165', '10.111.136.136/27', '10.111.136.168/27'),
('BGS42', '2', 'R0831', '0', '1', '10.111.104.2', '10.111.104.130', '10.111.146.134/27', '10.111.146.166/27'),
('BGS42', '2', 'R0831', '1', '2', '10.111.104.3', '10.111.104.131', '10.111.146.133/27', '10.111.146.165/27'),
('BGS42', '2', 'R0831', '2', '3', '10.111.104.4', '10.111.104.132', '10.111.146.147/27', '10.111.146.179/27'),
('BGS42', '2', 'R0831', '3', '4', '10.111.104.5', '10.111.104.133', '10.111.146.135/27', '10.111.146.167/27'),
('BGS42', '2', 'R0835', '0', '0', '10.111.104.66', '10.111.104.194', '10.111.146.134/27', '10.111.146.166/27'),
('BGS42', '2', 'R0835', '1', '3', '10.111.104.67', '10.111.104.195', '10.111.146.133/27', '10.111.146.165/27'),
('BGS42', '2', 'R0835', '2', '1', '10.111.104.68', '10.111.104.196', '10.111.146.147/27', '10.111.146.179/27'),
('BGS42', '2', 'R0835', '3', '2', '10.111.104.69', '10.111.104.197', '10.111.146.135/27', '10.111.146.167/27'),
('BGS42', '2', 'R1031', '0', '4', '10.111.101.2', '10.111.101.130', '10.111.146.135/27', '10.111.146.167/27'),
('BGS42', '2', 'R1031', '1', '0', '10.111.101.3', '10.111.101.131', '10.111.146.136/27', '10.111.146.168/27'),
('BGS42', '2', 'R1031', '2', '1', '10.111.101.4', '10.111.101.132', '10.111.146.137/27', '10.111.146.169/27'),
('BGS42', '2', 'R1031', '3', '2', '10.111.101.5', '10.111.101.133', '10.111.146.138/27', '10.111.146.170/27'),
('BGS42', '2', 'R1035', '0', '1', '10.111.101.66', '10.111.101.194', '10.111.146.136/27', '10.111.146.168/27'),
('BGS42', '2', 'R1035', '1', '2', '10.111.101.67', '10.111.101.195', '10.111.146.137/27', '10.111.146.169/27'),
('BGS42', '2', 'R1035', '2', '4', '10.111.101.68', '10.111.101.196', '10.111.146.138/27', '10.111.146.170/27'),
('BGS42', '2', 'R1035', '3', '0', '10.111.101.69', '10.111.101.197', '10.111.146.139/27', '10.111.146.171/27'),
('BGS42', '0', 'R4234', '0', '0', '10.111.102.50', '10.111.102.178', '10.111.146.144/27', '10.111.146.176/27'),
('BGS42', '0', 'R4234', '1', '3', '10.111.102.51', '10.111.102.179', '10.111.146.145/27', '10.111.146.177/27'),
('BGS42', '0', 'R4234', '2', '1', '10.111.102.52', '10.111.102.180', '10.111.146.146/27', '10.111.146.178/27'),
('BGS42', '0', 'R4234', '3', '2', '10.111.102.53', '10.111.102.181', '10.111.146.147/27', '10.111.146.179/27'),
('BGS42', '3', 'R5433', '0', '3', '10.111.103.34', '10.111.103.162', '10.111.146.134/27', '10.111.146.166/27'),
('BGS42', '3', 'R5433', '1', '1', '10.111.103.35', '10.111.103.163', '10.111.146.133/27', '10.111.146.165/27'),
('BGS42', '3', 'R5433', '2', '4', '10.111.103.36', '10.111.103.164', '10.111.146.147/27', '10.111.146.179/27'),
('BGS42', '3', 'R5433', '3', '2', '10.111.103.37', '10.111.103.165', '10.111.146.135/27', '10.111.146.167/27'),
('BGS54', '3', 'R0831', '0', '1', '10.111.104.2', '10.111.104.130', '10.111.184.77/27', '10.111.184.205/27'),
('BGS54', '3', 'R0831', '1', '2', '10.111.104.3', '10.111.104.131', '10.111.184.78/27', '10.111.184.206/27'),
('BGS54', '3', 'R0831', '2', '3', '10.111.104.4', '10.111.104.132', '10.111.184.79/27', '10.111.184.207/27'),
('BGS54', '3', 'R0831', '3', '4', '10.111.104.5', '10.111.104.133', '10.111.184.80/27', '10.111.184.208/27'),
('BGS54', '3', 'R0835', '0', '0', '10.111.104.66', '10.111.104.194', '10.111.184.78/27', '10.111.184.206/27'),
('BGS54', '3', 'R0835', '1', '3', '10.111.104.67', '10.111.104.195', '10.111.184.79/27', '10.111.184.207/27'),
('BGS54', '3', 'R0835', '2', '1', '10.111.104.68', '10.111.104.196', '10.111.184.80/27', '10.111.184.208/27'),
('BGS54', '3', 'R0835', '3', '2', '10.111.104.69', '10.111.104.197', '10.111.184.81/27', '10.111.184.209/27'),
('BGS54', '3', 'R1031', '0', '4', '10.111.101.2', '10.111.101.130', '10.111.184.74/27', '10.111.184.202/27'),
('BGS54', '3', 'R1031', '1', '0', '10.111.101.3', '10.111.101.131', '10.111.184.70/27', '10.111.184.198/27'),
('BGS54', '3', 'R1031', '2', '1', '10.111.101.4', '10.111.101.132', '10.111.184.71/27', '10.111.184.199/27'),
('BGS54', '3', 'R1031', '3', '2', '10.111.101.5', '10.111.101.133', '10.111.184.72/27', '10.111.184.200/27'),
('BGS54', '3', 'R1035', '0', '1', '10.111.101.66', '10.111.101.194', '10.111.184.74/27', '10.111.184.202/27'),
('BGS54', '3', 'R1035', '1', '2', '10.111.101.67', '10.111.101.195', '10.111.184.70/27', '10.111.184.198/27'),
('BGS54', '3', 'R1035', '2', '4', '10.111.101.68', '10.111.101.196', '10.111.184.71/27', '10.111.184.199/27'),
('BGS54', '3', 'R1035', '3', '0', '10.111.101.69', '10.111.101.197', '10.111.184.72/27', '10.111.184.200/27'),
('BGS54', '3', 'R4234', '0', '0', '10.111.102.50', '10.111.102.178', '10.111.184.73/27', '10.111.184.201/27'),
('BGS54', '3', 'R4234', '1', '3', '10.111.102.51', '10.111.102.179', '10.111.184.69/27', '10.111.184.197/27'),
('BGS54', '3', 'R4234', '2', '1', '10.111.102.52', '10.111.102.180', '10.111.184.75/27', '10.111.184.203/27'),
('BGS54', '3', 'R4234', '3', '2', '10.111.102.53', '10.111.102.181', '10.111.184.76/27', '10.111.184.204/27'),
('BGS54', '0', 'R5433', '0', '3', '10.111.103.34', '10.111.103.162', '10.111.184.76/27', '10.111.184.204/27'),
('BGS54', '0', 'R5433', '1', '1', '10.111.103.35', '10.111.103.163', '10.111.184.77/27', '10.111.184.205/27'),
('BGS54', '0', 'R5433', '2', '4', '10.111.103.36', '10.111.103.164', '10.111.184.78/27', '10.111.184.206/27'),
('BGS54', '0', 'R5433', '3', '2', '10.111.103.37', '10.111.103.165', '10.111.184.79/27', '10.111.184.207/27');

-- --------------------------------------------------------

--
-- 视图结构 `vnfr`
--
DROP TABLE IF EXISTS `vnfr`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnfr` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNFR:NA1,',`znsi`.`spc`,';') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vngc_ina`
--
DROP TABLE IF EXISTS `vngc_ina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vngc_ina` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNGC:NA1,',`znsi`.`spc`,':INA;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vnhc_ina`
--
DROP TABLE IF EXISTS `vnhc_ina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnhc_ina` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNHC:NA1,',`znsi`.`spc`,':FE:INA;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vnlc_ina`
--
DROP TABLE IF EXISTS `vnlc_ina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnlc_ina` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNLC:',`znsi`.`sln`,',INA;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vnld`
--
DROP TABLE IF EXISTS `vnld`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnld` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNLD:',`znsi`.`sln`,';') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vnrr`
--
DROP TABLE IF EXISTS `vnrr`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnrr` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNRR:NA1,',`znsi`.`spc`,':NA1,',`znsi`.`spc`,';') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vnsr`
--
DROP TABLE IF EXISTS `vnsr`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnsr` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNSR:NA1,',`znsi`.`spc`,',',`znsi`.`linkset`,':',`znsi`.`sln`,';') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vnvc_ina`
--
DROP TABLE IF EXISTS `vnvc_ina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnvc_ina` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNVC:NA1,',`znsi`.`spc`,':NA1,',`znsi`.`spc`,':INA;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vnvd`
--
DROP TABLE IF EXISTS `vnvd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vnvd` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNVD:NA1,',`znsi`.`spc`,':NA1,',`znsi`.`spc`,';') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `voyd`
--
DROP TABLE IF EXISTS `voyd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voyd` AS select distinct `zoyi`.`bsc_id` AS `bsc_id`,`zoyi`.`set_name` AS `set_name`,concat('ZOYD:',`zoyi`.`set_name`,';') AS `cmd` from `zoyi` where concat(`zoyi`.`bsc_id`,`zoyi`.`set_name`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `voyr`
--
DROP TABLE IF EXISTS `voyr`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voyr` AS select `zoyi`.`bsc_id` AS `bsc_id`,`zoyi`.`set_name` AS `set_name`,concat('ZOYR:',`zoyi`.`set_name`,':',`zoyi`.`id`,';') AS `cmd` from `zoyi` where concat(`zoyi`.`bsc_id`,`zoyi`.`set_name`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `voys_ina`
--
DROP TABLE IF EXISTS `voys_ina`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `voys_ina` AS select `zoyi`.`bsc_id` AS `bsc_id`,`zoyi`.`set_name` AS `set_name`,concat('ZOYS:M3UA:',`zoyi`.`set_name`,',',`zoyi`.`id`,':INA;') AS `cmd` from `zoyi` where concat(`zoyi`.`bsc_id`,`zoyi`.`set_name`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vznfd`
--
DROP TABLE IF EXISTS `vznfd`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vznfd` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `set_name`,concat('ZNFD:NA1,',`znsi`.`spc`,',1::FE,BSSAP,1;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vzngc_act`
--
DROP TABLE IF EXISTS `vzngc_act`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vzngc_act` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNGC:NA1,',`znsi`.`spc`,':ACT;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vznhc_act`
--
DROP TABLE IF EXISTS `vznhc_act`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vznhc_act` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNHC:NA1,',`znsi`.`spc`,':FE:ACT;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vznla`
--
DROP TABLE IF EXISTS `vznla`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vznla` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNLA:',`znsi`.`sln`,';') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vznlc_act`
--
DROP TABLE IF EXISTS `vznlc_act`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vznlc_act` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNLC:',`znsi`.`sln`,',ACT;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vznra`
--
DROP TABLE IF EXISTS `vznra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vznra` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `set_name`,concat('ZNRA:NA1,',`znsi`.`spc`,',',`znsi`.`linkset`,':NA1,',`znsi`.`spc`,',',`znsi`.`linkset`,',2;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vznrb`
--
DROP TABLE IF EXISTS `vznrb`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vznrb` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `set_name`,concat('ZNRB:NA1,',`znsi`.`spc`,':PARA=6;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vznsp`
--
DROP TABLE IF EXISTS `vznsp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vznsp` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `set_name`,concat('ZNSP:NA1,',`znsi`.`spc`,',',`znsi`.`linkset`,':',`znsi`.`sln`,':',`znsi`.`linkset`,';') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vznva`
--
DROP TABLE IF EXISTS `vznva`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vznva` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNVA:NA1,',`znsi`.`spc`,':NA1,',`znsi`.`spc`,';') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vznvc_act`
--
DROP TABLE IF EXISTS `vznvc_act`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vznvc_act` AS select `znsi`.`bsc_id` AS `bsc_id`,`znsi`.`linkset` AS `linkset`,concat('ZNVC:NA1,',`znsi`.`spc`,':NA1,',`znsi`.`spc`,':ACT;') AS `cmd` from `znsi` where concat(`znsi`.`bsc_id`,`znsi`.`linkset`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vzoya`
--
DROP TABLE IF EXISTS `vzoya`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vzoya` AS select `zoyi`.`bsc_id` AS `bsc_id`,`zoyi`.`set_name` AS `set_name`,concat('ZOYA:',`zoyi`.`set_name`,':BCSU,',`zoyi`.`bcsu`,':AOIP;') AS `cmd` from `zoyi` where concat(`zoyi`.`bsc_id`,`zoyi`.`set_name`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vzoyc`
--
DROP TABLE IF EXISTS `vzoyc`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vzoyc` AS select distinct `zoyi`.`bsc_id` AS `bsc_id`,`zoyi`.`set_name` AS `set_name`,concat('ZOYC:',`zoyi`.`set_name`,':C:M3UA;') AS `cmd` from `zoyi` where concat(`zoyi`.`bsc_id`,`zoyi`.`set_name`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vzoym`
--
DROP TABLE IF EXISTS `vzoym`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vzoym` AS select distinct `zoyi`.`bsc_id` AS `bsc_id`,`zoyi`.`set_name` AS `set_name`,concat('ZOYM:',`zoyi`.`set_name`,':REG=Y') AS `cmd` from `zoyi` where concat(`zoyi`.`bsc_id`,`zoyi`.`set_name`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vzoyp`
--
DROP TABLE IF EXISTS `vzoyp`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vzoyp` AS select `zoyi`.`bsc_id` AS `bsc_id`,`zoyi`.`set_name` AS `set_name`,concat('ZOYP:M3UA:',`zoyi`.`set_name`,',',`zoyi`.`id`,':"',`zoyi`.`sou_el0`,'","',`zoyi`.`sou_el1`,'":"',`zoyi`.`tar_el0`,'","',`zoyi`.`tar_el1`,'",2905;') AS `cmd` from `zoyi` where concat(`zoyi`.`bsc_id`,`zoyi`.`set_name`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

-- --------------------------------------------------------

--
-- 视图结构 `vzoys_act`
--
DROP TABLE IF EXISTS `vzoys_act`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vzoys_act` AS select `zoyi`.`bsc_id` AS `bsc_id`,`zoyi`.`set_name` AS `set_name`,concat('ZOYS:M3UA:',`zoyi`.`set_name`,',',`zoyi`.`id`,':ACT;') AS `cmd` from `zoyi` where concat(`zoyi`.`bsc_id`,`zoyi`.`set_name`) in (select concat(`plan_aoip_del`.`bsc_id`,`plan_aoip_del`.`linkset`) from `plan_aoip_del`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
