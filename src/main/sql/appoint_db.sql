/*
SQLyog v10.2 
MySQL - 5.6.22-log : Database - appoint_db
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`appoint_db` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `appoint_db`;

/*Table structure for table `appointment` */

DROP TABLE IF EXISTS `appointment`;

CREATE TABLE `appointment` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pname` varchar(50) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  `visitime` varchar(20) DEFAULT NULL,
  `visitseq` text,
  PRIMARY KEY (`aid`),
  KEY `fk_user` (`uid`),
  KEY `fk_patient` (`pname`),
  KEY `fk_mediciner` (`mid`),
  CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`mid`) REFERENCES `mediciner` (`mid`),
  CONSTRAINT `appointment_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8;

/*Data for the table `appointment` */

insert  into `appointment`(`aid`,`uid`,`pname`,`mid`,`visitime`,`visitseq`) values (1,2,'2',4,'2016-04-20  星期三下午','1'),(2,3,'3',4,'2016-04-20  星期三下午','2'),(3,1,'1',4,'2016-04-20  星期三下午','3'),(4,8,'8',4,'2016-04-20  星期三下午','4'),(5,4,'4',4,'2016-04-20  星期三下午','5'),(6,5,'5',4,'2016-04-20  星期三下午','6'),(7,6,'6',4,'2016-04-20  星期三下午','7'),(8,7,'7',4,'2016-04-20  星期三下午','8'),(9,12,'12',4,'2016-04-20  星期三下午','9'),(10,13,'13',4,'2016-04-20  星期三下午','10'),(16,18,'18',2,'2016-04-25  星期一下午','1'),(17,1,'1',2,'2016-04-25  星期一下午','2'),(18,2,'2',2,'2016-04-25  星期一下午','3'),(19,3,'3',2,'2016-04-25  星期一下午','4'),(20,4,'4',2,'2016-04-25  星期一下午','5'),(21,8,'8',2,'2016-04-25  星期一下午','6'),(22,7,'20',2,'2016-04-25  星期一下午','7'),(23,6,'6',2,'2016-04-25  星期一下午','8'),(24,5,'5',2,'2016-04-25  星期一下午','9'),(25,9,'9',2,'2016-04-25  星期一下午','10'),(26,10,'10',2,'2016-04-25  星期一下午','11'),(27,13,'13',2,'2016-04-25  星期一下午','12'),(28,12,'12',2,'2016-04-25  星期一下午','13'),(29,11,'11',2,'2016-04-25  星期一下午','14'),(30,14,'14',2,'2016-04-25  星期一下午','15'),(31,15,'15',2,'2016-04-25  星期一下午','16'),(32,16,'16',2,'2016-04-25  星期一下午','17'),(33,17,'17',2,'2016-04-25  星期一下午','18'),(34,5,'5',4,'2016-04-22  星期五上午','1'),(35,1,'1',4,'2016-04-22  星期五上午','2'),(36,2,'2',4,'2016-04-22  星期五上午','3'),(37,4,'4',4,'2016-04-22  星期五上午','4'),(38,3,'3',4,'2016-04-22  星期五上午','5'),(39,6,'6',4,'2016-04-22  星期五上午','6'),(40,7,'7',4,'2016-04-22  星期五上午','7'),(41,11,'11',4,'2016-04-22  星期五上午','8'),(42,17,'12',4,'2016-04-22  星期五上午','9'),(43,8,'8',4,'2016-04-22  星期五上午','10'),(44,9,'9',4,'2016-04-22  星期五上午','11'),(45,10,'10',4,'2016-04-22  星期五上午','12'),(47,13,'13',4,'2016-04-22  星期五上午','14'),(54,9,'9',4,'2016-04-20  星期三下午','11'),(55,10,'21',4,'2016-04-20  星期三下午','12'),(56,22,'22',4,'2016-04-20  星期三下午','13'),(57,23,'23',4,'2016-04-20  星期三下午','14'),(59,24,'24',4,'2016-04-20  星期三下午','15'),(60,1,'1',5,'2017-04-10  星期一上午','1'),(61,2,'2',5,'2017-04-10  星期一上午','2'),(62,1,'张一男',3,'2018-06-21  星期四上午','1\r\n'),(64,1,'张一男',5,'2018-06-20  星期三下午','1'),(65,1,'张一男',1,'2018-07-19  星期四上午','1'),(66,1,'张一男',1,'2018-07-17  星期二下午','1'),(67,1,'张一男',2,'2018-07-23  星期一下午','1'),(68,1,'张一男',3,'2018-07-19  星期四上午','1'),(69,1,'张一男',5,'2018-07-18  星期三下午','1'),(70,2,'张二男',1,'2018-07-17  星期二下午','2'),(71,1,'张一男',11,'2018-07-23  星期一上午','1'),(72,3,'张三男',1,'2018-07-17  星期二下午','3'),(73,1,'张一男',4,'2018-07-20  星期五上午','1'),(74,1,'张一男',1,'2018-07-17  星期二上午','1'),(77,1,'张一男',6,'2018-07-19  星期四上午','1'),(79,1,'张一男',8,'2018-07-19  星期四上午','1'),(80,1,'张一男',1,'2018-07-24  星期二上午','1'),(81,1,'张一男',1,'2018-07-24  星期二下午','1'),(82,1,'张一男',7,'2018-07-19  星期四上午','1'),(83,3,'张三男',1,'2018-07-24  星期二上午','2'),(84,4,'张四男',1,'2018-07-19  星期四上午','2');

/*Table structure for table `dept` */

DROP TABLE IF EXISTS `dept`;

CREATE TABLE `dept` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `dname` varchar(20) NOT NULL,
  `dspec` varchar(500) DEFAULT NULL,
  `pdid` int(11) DEFAULT NULL,
  PRIMARY KEY (`did`),
  UNIQUE KEY `unique_dname` (`dname`),
  KEY `fk_dept` (`pdid`),
  CONSTRAINT `fk_dept` FOREIGN KEY (`pdid`) REFERENCES `dept` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

/*Data for the table `dept` */

insert  into `dept`(`did`,`dname`,`dspec`,`pdid`) values (1,'内科',NULL,NULL),(2,'外科',NULL,NULL),(3,'儿科',NULL,NULL),(4,'口腔科',NULL,NULL),(5,'眼科',NULL,NULL),(6,'骨科',NULL,NULL),(7,'妇产科',NULL,NULL),(8,'心血管内科',NULL,1),(9,'神经内科','主要诊治脑血管疾病（脑梗塞、脑出血）、偏头痛、脑部炎症性疾病（脑炎、脑膜炎）、脊髓炎、癫痫、痴呆、神经系统变性病、代谢病和遗传病、三叉神经痛、坐骨神经病、周围神经病（四肢麻木、无力）及重症肌无力等',1),(10,'内分泌科',NULL,1),(11,'呼吸内科',NULL,1),(12,'消化内科',NULL,1),(13,'肾脏内科','肾内科是各级医院为了诊疗肾脏病而设置的一个临床科室。常见的肾脏替代治疗方式有肾移植、血液透析和腹膜透析',1),(14,'风湿免疫科',NULL,1),(15,'血液科',NULL,1),(16,'感染科',NULL,1),(17,'肝病科',NULL,1),(18,'泌尿外科',NULL,2),(19,'神经外科',NULL,2),(20,'心脏外科',NULL,2),(21,'胸外科',NULL,2),(22,'胃外科',NULL,2),(23,'肠外科',NULL,2),(24,'肝外科',NULL,2),(25,'胆外科',NULL,2),(26,'血管外科',NULL,2),(27,'外伤科',NULL,2),(28,'烧伤科',NULL,2),(29,'小儿消化科',NULL,3),(30,'小儿呼吸科','儿童哮喘、婴儿喘息、反复呼吸道感染、慢性咳嗽、肺炎等疑难杂症',3),(31,'小儿皮肤科','主要治疗幼儿、儿童的各种皮肤病，常见皮肤病有牛皮癣 、 疱疹 、酒渣鼻 、脓疱疮等',3),(32,'儿童保健科',NULL,3),(33,'新生儿科',NULL,3),(34,'小儿骨科',NULL,3),(35,'小儿心血管内科',NULL,3),(36,'小儿免疫科',NULL,3),(37,'小儿肾内科',NULL,3),(38,'小儿血液科',NULL,3),(39,'小儿内分泌科',NULL,3),(40,'小儿外科',NULL,3),(41,'小儿心外科',NULL,3),(42,'小儿胸外科',NULL,3),(43,'小儿神经外科',NULL,3),(44,'小儿泌尿科',NULL,3),(45,'小儿遗传病科',NULL,3),(46,'小儿耳鼻喉科',NULL,3),(47,'口腔修复科',NULL,4),(48,'正畸科',NULL,4),(49,'牙体牙髓科',NULL,4),(50,'牙周科',NULL,4),(51,'种植科',NULL,4),(52,'口腔粘膜科','口腔粘膜科是治疗粘膜病的专业科室，主要从事口腔粘膜病的治疗',4),(53,'口腔预防科',NULL,4),(54,'儿童口腔科',NULL,4),(55,'眼视光学科',NULL,5),(56,'眼外伤科',NULL,5),(57,'眼底科',NULL,5),(58,'白内障科',NULL,5),(59,'角膜科',NULL,5),(60,'青光眼科',NULL,5),(61,'眼整形科',NULL,5),(62,'小儿眼科',NULL,5),(63,'骨关节科',NULL,6),(64,'脊柱外科','专门诊治脊柱骨折、创伤、颈椎病、腰椎间盘突出症、脊柱肿瘤、颈、腰人工椎间盘置换、脊柱翻修等',6),(65,'足踝外科',NULL,6),(66,'创伤外科',NULL,6),(67,'运动医学科',NULL,6),(68,'矫形骨科',NULL,6),(69,'妇科',NULL,7),(70,'产科',NULL,7),(71,'产前诊断科',NULL,7),(72,'计划生育科',NULL,7),(73,'妇泌尿科',NULL,7),(74,'妇科内分泌',NULL,7),(75,'遗传科',NULL,7),(76,'过敏反应科',NULL,1),(77,'老年病科',NULL,1),(78,'肿瘤科',NULL,NULL),(79,'肿瘤内科',NULL,78);

/*Table structure for table `hospital` */

DROP TABLE IF EXISTS `hospital`;

CREATE TABLE `hospital` (
  `hid` int(11) NOT NULL AUTO_INCREMENT,
  `hname` varchar(20) NOT NULL,
  `address` varchar(30) DEFAULT NULL,
  `grade` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`hid`),
  UNIQUE KEY `unique_hname` (`hname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `hospital` */

insert  into `hospital`(`hid`,`hname`,`address`,`grade`) values (1,'武汉同济医院','武汉市解放大道1095号','三甲'),(2,'武汉协和医院','武汉市解放大道1277','三甲'),(3,'湖北省人民医院','武汉市张之洞路95','三甲'),(4,'武汉市第一医院','武汉市中山大道215号','三甲'),(5,'武汉市第四医院','武汉市汉正街472号','三甲'),(6,'武汉市第六医院','武汉市香港路80号','三乙'),(7,'武汉市第九医院','武汉市吉林街20号','二级'),(8,'武汉市商业职工医院','武汉市大兴路13号','二级');

/*Table structure for table `mediciner` */

DROP TABLE IF EXISTS `mediciner`;

CREATE TABLE `mediciner` (
  `mid` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(20) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `mspec` varchar(20) DEFAULT NULL,
  `surgeryweekday` varchar(20) DEFAULT NULL,
  `limitvisits` int(11) DEFAULT NULL,
  `hospital` varchar(20) DEFAULT NULL,
  `dept` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`mid`),
  KEY `fk_hospital` (`hospital`),
  KEY `fk_deptname` (`dept`),
  CONSTRAINT `fk_deptname` FOREIGN KEY (`dept`) REFERENCES `dept` (`dname`),
  CONSTRAINT `fk_hospital` FOREIGN KEY (`hospital`) REFERENCES `hospital` (`hname`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

/*Data for the table `mediciner` */

insert  into `mediciner`(`mid`,`mname`,`gender`,`title`,`mspec`,`surgeryweekday`,`limitvisits`,`hospital`,`dept`) values (1,'蔡红国','男','主任医师',NULL,'星期二上午,星期二下午,星期四上午',18,'武汉协和医院','小儿呼吸科'),(2,'陈乾坤','男','副主任医师',NULL,'星期一下午,星期三上午,星期三下午',18,'武汉市第一医院','消化内科'),(3,'陈诗云','女','主任医师',NULL,'星期三上午,星期四上午',15,'湖北省人民医院','小儿皮肤科'),(4,'曹磊军','男','主任医师',NULL,'星期三上午,星期三下午,星期五上午',15,'武汉同济医院','口腔粘膜科'),(5,'崔敬娴','女','副主任医师',NULL,'星期三下午,星期四上午',18,'武汉市第四医院','骨关节科'),(6,'邓红娟','女','主任医师',NULL,'星期一上午,星期三上午,星期五下午',16,'武汉同济医院','脊柱外科'),(7,'邓金余','男','副主任医师',NULL,'星期三上午,星期三下午,星期五上午',18,'湖北省人民医院','泌尿外科'),(8,'方新章','男','主任医师',NULL,'星期二下午,星期四上午',15,'武汉协和医院','肾脏内科'),(9,'董琴怡','女','主任医师',NULL,'星期三下午,星期四上午,星期四下午',18,'武汉同济医院','小儿皮肤科'),(11,'张兆辉','男','副主任医师',NULL,'星期一上午,星期二上午',15,'武汉同济医院','神经内科');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `pwd` varchar(10) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `gender` varchar(2) NOT NULL,
  `identity` varchar(20) DEFAULT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`uid`,`username`,`pwd`,`uname`,`gender`,`identity`,`mobile`) values (1,'zhang1m','123','张一男','男','42010419780210****','15927092***'),(2,'zhang2m','123','张二男','男','42020119690112****','1381212****'),(3,'zhang3m','123','张三男','男','42010419821012****','1369898****'),(4,'zhang4m','123','张四男','男',NULL,NULL),(5,'zhang5m','123','张五男','男',NULL,NULL),(6,'zhang6m','123','张六男','男',NULL,NULL),(7,'zhang7m','123','张七男','男',NULL,NULL),(8,'zhang8m','123','张八男','男',NULL,NULL),(9,'zhang9m','123','张九男','男',NULL,NULL),(10,'zhang0m','123','张零男','男',NULL,NULL),(11,'zhang0f','123','张零女','女',NULL,NULL),(12,'zhang1f','123','张一女','女',NULL,NULL),(13,'zhang2f','123','张二女','女',NULL,NULL),(14,'zhang3f','123','张三女','女',NULL,NULL),(15,'zhang4f','123','张四女','女',NULL,NULL),(16,'zhang5f','123','张五女','女',NULL,NULL),(17,'zhang6f','123','张六女','女',NULL,NULL),(18,'zhang7f','123','张七女','女',NULL,NULL),(19,'zhang8f','123','张八女','女',NULL,NULL),(20,'zhang9f','123','张九女','女',NULL,NULL),(21,'li0f','123','李零女','女',NULL,NULL),(22,'li1f','123','李一女','女',NULL,NULL),(23,'li2f','123','李二女','女',NULL,NULL),(24,'li3f','123','李三女','女',NULL,NULL),(25,'li4f','123','李四女','女',NULL,NULL),(26,'li5f','123','李五女','女',NULL,NULL),(27,'li6f','123','李六女','女',NULL,NULL),(28,'li7f','123','李七女','女',NULL,NULL),(29,'li8f','123','李八女','女',NULL,NULL),(30,'li9f','123','李九女','女',NULL,NULL),(31,'li0m','123','李零男','男',NULL,NULL),(32,'li1m','123','李一男','男',NULL,NULL),(33,'li2m','123','李二男','男',NULL,NULL),(34,'li3m','123','李三男','男',NULL,NULL),(35,'li4m','123','李四男','男',NULL,NULL),(36,'li5m','123','李五男','男',NULL,NULL),(37,'li6m','123','李六男','男',NULL,NULL),(38,'li7m','123','李七男','男',NULL,NULL),(39,'li8m','123','李八男','男',NULL,NULL),(40,'li9m','123','李九男','男',NULL,NULL),(41,'wang0m','123','王零男','男',NULL,NULL),(42,'wang1m','123','王一男','男',NULL,NULL),(43,'wang2m','123','王二男','男',NULL,NULL),(44,'wang3m','123','王三男','男',NULL,NULL),(45,'wang4m','123','王四男','男',NULL,NULL),(46,'wang5m','123','王五男','男',NULL,NULL),(47,'wang6m','123','王六男','男',NULL,NULL),(48,'wang7m','123','王七男','男',NULL,NULL),(49,'wang8m','123','王八男','男',NULL,NULL),(50,'wang9m','123','王九男','男',NULL,NULL),(51,'wang0f','123','王零女','女',NULL,NULL),(52,'wang1f','123','王一女','女',NULL,NULL),(53,'wang2f','123','王二女','女',NULL,NULL),(54,'wang3f','123','王三女','女',NULL,NULL),(55,'wang4f','123','王四女','女',NULL,NULL),(56,'wang5f','123','王五女','女',NULL,NULL),(57,'wang6f','123','王六女','女',NULL,NULL),(58,'wang7f','123','王七女','女',NULL,NULL),(59,'wang8f','123','王八女','女',NULL,NULL),(60,'wang9f','123','王九女','女',NULL,NULL),(61,'zhao1m','123','赵一男','男',NULL,NULL);

/* Procedure structure for procedure `pro_appointment` */

/*!50003 DROP PROCEDURE IF EXISTS  `pro_appointment` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `pro_appointment`(
	_u_id int,-- 用户编号
	_p_name VARCHAR(50),-- 病人名
	_m_id int,-- 医生名
	_visit_time varchar(20),-- 就诊时间
	out flag int -- 结果
	
    )
BEGIN
	DECLARE _limit_visits int;-- 最大就诊人数
	DECLARE _visit_seq int;-- 今日已经就诊人数
	DECLARE _uid_beingness int;-- 用户存在性判断
	declare _visit_beingness INT;-- 预约存在性判断
	
	-- 查询用户是否为同一病患在同一时间预约过同一医生,如果是则为_visit_beingness赋值为预约id
	select `aid` into _visit_beingness from `appointment` where 
	`uid`=_u_id and `pname`=_p_name and `mid`=_m_id and `visitime` =_visit_time;
	
	-- 查询就诊人是否注册，如果注册则为_uid_beingness赋值为注册id
	select `uid` into _uid_beingness from `user` where `uname` = _p_name;
	
	-- 定于查询语句
	select `limitvisits` into _limit_visits from `mediciner` where`mid` = _m_id;
	
	select max(`visitseq`) into _visit_seq from `appointment` where `mid` = _m_id and `visitime` = _visit_time;
	
	-- 开始事务
	START TRANSACTION;
	-- 判断用户是否存在
	if(_uid_beingness !=0 )then 
		begin
		-- 判断是否超过每日限定预约次数
		if(_visit_seq<_limit_visits or _visit_seq IS NULL) then
			begin
			-- 如果预约次数不存在则设为1反之次数加一
			if(_visit_seq IS NULL) then
				SET _visit_seq = 1;
			else
				set _visit_seq = _visit_seq+1;
			end if;
			-- 判断是否预约过
			IF(_visit_beingness !=0 )THEN 
				SELECT '对不起,您已经预约过该医生了,不能重复预约!';
				SET flag = -2;
				ROLLBACK;
			else
				INSERT INTO `appointment` VALUES(NULL,_u_id,_p_name,_m_id,_visit_time,_visit_seq);
				SELECT '添加成功！';
				SET flag = _visit_seq;
				COMMIT;
			end if;
			end;
		else
			SELECT '该位医生预约满了';
			SET flag = 0;
			ROLLBACK;
		end if;
		END;
	ELSE	
		SELECT '就诊人不存在';
		SET flag = -1;
		ROLLBACK;
	end if;
	
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
