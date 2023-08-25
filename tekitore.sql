DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `staff_name` varchar(10) NOT NULL DEFAULT '',
  `login_password` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `staff` WRITE;
INSERT INTO `staff` VALUES (1,'StuffA','a'),(2,'StuffB','b');
UNLOCK TABLES;

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_number` varchar(10) NOT NULL,
  `student_name` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`student_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `memo`;
CREATE TABLE `memo` (
  `memo_id` int NOT NULL AUTO_INCREMENT,
  `student_number` varchar(10) DEFAULT NULL,
  `updated_staff_id` int DEFAULT NULL,
  `memo` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`memo_id`),
  KEY `FK_memo_student_number` (`student_number`),
  KEY `FK_memo_staff_id` (`updated_staff_id`),
  CONSTRAINT `FK_memo_staff_id` FOREIGN KEY (`updated_staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE,
  CONSTRAINT `FK_memo_student_number` FOREIGN KEY (`student_number`) REFERENCES `student` (`student_number`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

------------------------------------------------------------------------------------------

create table users(
	student_number varchar(7) primary key,
	pass varchar(15) not null,
	first_name varchar(20) not null,
  last_name varchar(20) not null,
	tel varchar(20),
	mail_address varchar(50) not null
);

insert into users values(
	'2012006',
	'pass',
	'川口',
  '竜空',
	'08058371112',
	's2012006@s.do-johodai.ac.jp'
);

create TABLE items (
  item_id INT primary key AUTO_INCREMENT,
  item_name varchar(30) not null,
  item_detail varchar(500) not null,
  item_state varchar(20) not null,
  used_lecture varchar(20),
  item_price int not null,
  sale_state bit not null,
  date_time DATE not null,
  student_number varchar(7),
  FOREIGN KEY(student_number) REFERENCES users(student_number) ON UPDATE CASCADE ON DELETE CASCADE
);

create table items_img (
  img_id int primary key AUTO_INCREMENT,
  item_id int not null,
  item_path varchar(500) not null,
  FOREIGN KEY(item_id) REFERENCES items(item_id) ON UPDATE CASCADE ON DELETE CASCADE
);

create table transaction (
  ts_id int primary key AUTO_INCREMENT,
  item_id int not null,
  eb_number varchar(7) not null,
  pc_number varchar(7) not null,
  ts_date Date not null,
  FOREIGN KEY(item_id) REFERENCES items(item_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(eb_number) REFERENCES users(student_number) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(pc_number) REFERENCES items(student_number) ON UPDATE CASCADE ON DELETE CASCADE
);

create table ts_msg (
  msg_id int primary key,
  ts_id int not null,
  eb_number varchar(7) not null,
  pc_number varchar(7) not null,
  msg_date Date not null,
  FOREIGN KEY(ts_id) REFERENCES transaction(ts_id) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(eb_number) REFERENCES users(student_number) ON UPDATE CASCADE ON DELETE CASCADE,
  FOREIGN KEY(pc_number) REFERENCES items(student_number) ON UPDATE CASCADE ON DELETE CASCADE
);