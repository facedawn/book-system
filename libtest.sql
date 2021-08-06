<<<<<<< HEAD
<<<<<<< HEAD
/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : libtest

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 29/07/2021 15:01:13
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(36) NOT NULL,
  `book_auth` varchar(36) DEFAULT NULL,
  `book_pub` varchar(36) DEFAULT NULL,
  `ISBN` char(15) DEFAULT NULL,
  `book_pric` decimal(7,2) DEFAULT NULL,
  `book_intro` varchar(200) DEFAULT NULL,
  `in_library` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of book
-- ----------------------------
BEGIN;
INSERT INTO `book` VALUES (2, '微积分下', '乙', '华东师范大学出版社', '7291048562719', 11.00, '比上册更难了', 1);
INSERT INTO `book` VALUES (4, 'C++ Primer Plus', '丁', '厦门大学出版社', '3256768654324', 169.00, 'C++最好的教材之一', 0);
INSERT INTO `book` VALUES (5, '数据结构与算法', '戊', '商务印书馆', '2567897685765', 65.00, '比较适合初学者', 1);
INSERT INTO `book` VALUES (6, '离散数学', '己', '华东师范大学出版社', '0932482023432', 43.00, '屈教授yyds', 1);
INSERT INTO `book` VALUES (7, '概率论与数理统计', '戌', '商务印书馆', '2345678963322', 57.00, '书本讲的比较详细，要多看例题', 1);
INSERT INTO `book` VALUES (8, '大学物理上', '庚', '厦门大学出版社', '9878787233543', 59.00, '看似和高中相似，但要死要死', 1);
INSERT INTO `book` VALUES (9, '大学物理下', '壬', '商务印书馆', '7865437893246', 59.00, '看着都不和高中类似了，属于不好好学就要挂的范畴', 0);
INSERT INTO `book` VALUES (11, 'haruki9', '12', '123', '12312', 123.00, '123', 0);
INSERT INTO `book` VALUES (13, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (14, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (15, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (16, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (17, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (18, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (19, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (20, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (21, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (22, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (23, '1', '1', '1', '1', 1.00, '1', 1);
COMMIT;

-- ----------------------------
-- Table structure for book_rubbish_bin
-- ----------------------------
DROP TABLE IF EXISTS `book_rubbish_bin`;
CREATE TABLE `book_rubbish_bin` (
  `book_id` int NOT NULL,
  `book_name` varchar(36) NOT NULL,
  `book_auth` varchar(36) DEFAULT NULL,
  `book_pub` varchar(36) DEFAULT NULL,
  `ISBN` char(15) DEFAULT NULL,
  `book_pric` decimal(7,2) DEFAULT NULL,
  `book_intro` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of book_rubbish_bin
-- ----------------------------
BEGIN;
INSERT INTO `book_rubbish_bin` VALUES (1, '微积分上', '甲', '厦门大学出版社', '1827364829103', 9.99, '很难');
INSERT INTO `book_rubbish_bin` VALUES (3, '大学语文', '丙', '华东师范大学出版社', '2198473246589', 59.99, '当作休闲读物不错，但也有着一定的文学价值');
INSERT INTO `book_rubbish_bin` VALUES (10, '演员的自我修养', '癸', '清华大学出版社', '5786378949230', 2.33, '图一乐');
INSERT INTO `book_rubbish_bin` VALUES (12, 'haruki9', '12', '123', '12312', 123.00, '123');
COMMIT;

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `user_email` varchar(30) NOT NULL,
  `book_id` int DEFAULT NULL,
  `booking_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dealing_time` datetime DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`user_email`,`booking_time`) USING BTREE,
  KEY `book_id` (`book_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON UPDATE CASCADE,
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of booking
-- ----------------------------
BEGIN;
INSERT INTO `booking` VALUES ('haruki@qq.com', 2, '2021-07-28 17:29:01', '2021-07-28 17:34:35', -1);
INSERT INTO `booking` VALUES ('haruki@qq.com', 2, '2021-07-28 17:35:06', '2021-07-28 17:37:08', 0);
INSERT INTO `booking` VALUES ('haruki@qq.com', 11, '2021-07-28 18:15:50', '2021-07-28 18:19:24', -1);
INSERT INTO `booking` VALUES ('haruki@qq.com', 11, '2021-07-28 18:22:05', '2021-07-28 18:22:22', 0);
COMMIT;

-- ----------------------------
-- Table structure for fine_log
-- ----------------------------
DROP TABLE IF EXISTS `fine_log`;
CREATE TABLE `fine_log` (
  `user_email` varchar(30) NOT NULL,
  `book_id` int NOT NULL,
  `lend_time` datetime NOT NULL,
  `return_time` datetime DEFAULT NULL,
  `fine_amount` decimal(7,2) DEFAULT NULL,
  `pay_situ` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_email`,`book_id`,`lend_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of fine_log
-- ----------------------------
BEGIN;
INSERT INTO `fine_log` VALUES ('haruki@qq.com', 2, '2021-07-28 17:37:08', '2021-07-28 18:14:27', 193.05, 0);
COMMIT;

-- ----------------------------
-- Table structure for lend
-- ----------------------------
DROP TABLE IF EXISTS `lend`;
CREATE TABLE `lend` (
  `user_email` varchar(30) NOT NULL,
  `book_id` int NOT NULL,
  `lending_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `return_time` datetime DEFAULT NULL,
  `rest_num` int DEFAULT '5',
  PRIMARY KEY (`user_email`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `lend_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON UPDATE CASCADE,
  CONSTRAINT `lend_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of lend
-- ----------------------------
BEGIN;
INSERT INTO `lend` VALUES ('haruki@qq.com', 11, '2021-07-28 18:22:22', '2021-09-15 18:22:22', 0);
COMMIT;

-- ----------------------------
-- Table structure for lend_history
-- ----------------------------
DROP TABLE IF EXISTS `lend_history`;
CREATE TABLE `lend_history` (
  `user_email` varchar(30) NOT NULL,
  `book_id` int NOT NULL,
  `lending_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_email`,`book_id`,`lending_time`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `lend_history_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lend_history_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of lend_history
-- ----------------------------
BEGIN;
INSERT INTO `lend_history` VALUES ('haruki@qq.com', 5, '2021-07-28 18:04:11', '2021-07-28 20:15:36');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_email` varchar(30) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `rest_lend_num` int DEFAULT '20',
  `phone_num` char(15) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('12', '1233', '123', 20, NULL, 1);
INSERT INTO `user` VALUES ('123@qq.com', 'ShokuhouMisaki', '345678', 20, '363738391', 1);
INSERT INTO `user` VALUES ('456@qq.com', 'Index', '910JQK', 20, '213454535', 0);
INSERT INTO `user` VALUES ('haruki11@qq.com', 'harukitest', 'haruki', 20, NULL, 0);
INSERT INTO `user` VALUES ('haruki@qq.com', 'haruki9', 'haruki', 20, '1231203811', 0);
INSERT INTO `user` VALUES ('hsadaruki@qq.com', '1', '1', 20, NULL, 0);
INSERT INTO `user` VALUES ('isl@stu.xmu.edu.cn', 'user2', '654321', 20, '324242342', 0);
INSERT INTO `user` VALUES ('sasa@163.com', 'user3', '111111', 20, '788976534', 0);
COMMIT;

-- ----------------------------
-- Triggers structure for table book
-- ----------------------------
DROP TRIGGER IF EXISTS `book_del`;
delimiter ;;
CREATE TRIGGER `book_del` AFTER DELETE ON `book` FOR EACH ROW begin
  insert into libtest.book_rubbish_bin
  values(old.book_id, old.book_name, old.book_auth, old.book_pub, old.ISBN, old.book_pric, old.book_intro);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table booking
-- ----------------------------
DROP TRIGGER IF EXISTS `DealBooking`;
delimiter ;;
CREATE TRIGGER `DealBooking` AFTER UPDATE ON `booking` FOR EACH ROW begin
	if new.STATUS = 0 THEN	
		insert into libtest.lend(user_email, book_id)
		values
		(new.user_email, new.book_id);
	ELSEIF new.STATUS = -1 THEN
		update book
		set in_library = TRUE
		where book_id = new.book_id;
	END if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table booking
-- ----------------------------
DROP TRIGGER IF EXISTS `Booking`;
delimiter ;;
CREATE TRIGGER `Booking` AFTER INSERT ON `booking` FOR EACH ROW begin
		update book
		set in_library = FALSE
		where book_id = new.book_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table lend
-- ----------------------------
DROP TRIGGER IF EXISTS `book_lend`;
delimiter ;;
CREATE TRIGGER `book_lend` BEFORE INSERT ON `lend` FOR EACH ROW begin
  if new.return_time is null then
    set new.return_time = date_add(new.lending_time, interval 2 week);
  end if;
  update book
  set in_library = false
  where book_id = new.book_id;
  update user
  set rest_lend_num=rest_lend_num-1
    where user_email=new.user_email;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table lend
-- ----------------------------
DROP TRIGGER IF EXISTS `book_recv`;
delimiter ;;
CREATE TRIGGER `book_recv` BEFORE DELETE ON `lend` FOR EACH ROW begin
  insert into libtest.lend_history
  values
  (old.user_email, old.book_id, old.lending_time, now());
  update book
  set in_library = true
  where book_id = old.book_id;
  if convert(now(), date) > convert(old.return_time, date) then
    insert into fine_log
    values(old.user_email, old.book_id, old.lending_time, now(), datediff(convert(now(), date), convert(old.return_time, date)) * 0.55, 0);
  end if;
  update user
  set rest_lend_num=rest_lend_num+1
  where user_email=old.user_email;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
=======
=======
>>>>>>> ca65eb0be759ba9db93549e30143330123b57611
/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : libtest

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 29/07/2021 16:45:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_name` varchar(36) NOT NULL,
  `book_auth` varchar(36) DEFAULT NULL,
  `book_pub` varchar(36) DEFAULT NULL,
  `ISBN` char(15) DEFAULT NULL,
  `book_pric` decimal(7,2) DEFAULT NULL,
  `book_intro` varchar(200) DEFAULT NULL,
  `in_library` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of book
-- ----------------------------
BEGIN;
INSERT INTO `book` VALUES (2, '微积分下', '乙', '华东师范大学出版社', '7291048562719', 11.00, '比上册更难了', 0);
INSERT INTO `book` VALUES (4, 'C++ Primer Plus', '丁', '厦门大学出版社', '3256768654324', 169.00, 'C++最好的教材之一', 0);
INSERT INTO `book` VALUES (5, '数据结构与算法', '戊', '商务印书馆', '2567897685765', 65.00, '比较适合初学者', 1);
INSERT INTO `book` VALUES (6, '离散数学', '己', '华东师范大学出版社', '0932482023432', 43.00, '屈教授yyds', 1);
INSERT INTO `book` VALUES (7, '概率论与数理统计', '戌', '商务印书馆', '2345678963322', 57.00, '书本讲的比较详细，要多看例题', 1);
INSERT INTO `book` VALUES (8, '大学物理上', '庚', '厦门大学出版社', '9878787233543', 59.00, '看似和高中相似，但要死要死', 1);
INSERT INTO `book` VALUES (9, '大学物理下', '壬', '商务印书馆', '7865437893246', 59.00, '看着都不和高中类似了，属于不好好学就要挂的范畴', 0);
INSERT INTO `book` VALUES (11, 'haruki9', '12', '123', '12312', 123.00, '123', 0);
INSERT INTO `book` VALUES (13, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (14, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (15, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (16, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (17, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (18, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (19, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (20, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (21, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (22, 'haruki9', '12', '123', '12312', 123.00, '123', 1);
INSERT INTO `book` VALUES (23, '1', '1', '1', '1', 1.00, '1', 1);
COMMIT;

-- ----------------------------
-- Table structure for book_rubbish_bin
-- ----------------------------
DROP TABLE IF EXISTS `book_rubbish_bin`;
CREATE TABLE `book_rubbish_bin` (
  `book_id` int NOT NULL,
  `book_name` varchar(36) NOT NULL,
  `book_auth` varchar(36) DEFAULT NULL,
  `book_pub` varchar(36) DEFAULT NULL,
  `ISBN` char(15) DEFAULT NULL,
  `book_pric` decimal(7,2) DEFAULT NULL,
  `book_intro` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of book_rubbish_bin
-- ----------------------------
BEGIN;
INSERT INTO `book_rubbish_bin` VALUES (1, '微积分上', '甲', '厦门大学出版社', '1827364829103', 9.99, '很难');
INSERT INTO `book_rubbish_bin` VALUES (3, '大学语文', '丙', '华东师范大学出版社', '2198473246589', 59.99, '当作休闲读物不错，但也有着一定的文学价值');
INSERT INTO `book_rubbish_bin` VALUES (10, '演员的自我修养', '癸', '清华大学出版社', '5786378949230', 2.33, '图一乐');
INSERT INTO `book_rubbish_bin` VALUES (12, 'haruki9', '12', '123', '12312', 123.00, '123');
COMMIT;

-- ----------------------------
-- Table structure for booking
-- ----------------------------
DROP TABLE IF EXISTS `booking`;
CREATE TABLE `booking` (
  `user_email` varchar(30) NOT NULL,
  `book_id` int DEFAULT NULL,
  `booking_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dealing_time` datetime DEFAULT NULL,
  `status` int DEFAULT '1',
  PRIMARY KEY (`user_email`,`booking_time`) USING BTREE,
  KEY `book_id` (`book_id`),
  CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON UPDATE CASCADE,
  CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of booking
-- ----------------------------
BEGIN;
INSERT INTO `booking` VALUES ('haruki@qq.com', 2, '2021-07-28 17:29:01', '2021-07-28 17:34:35', -1);
INSERT INTO `booking` VALUES ('haruki@qq.com', 2, '2021-07-28 17:35:06', '2021-07-28 17:37:08', 0);
INSERT INTO `booking` VALUES ('haruki@qq.com', 11, '2021-07-28 18:15:50', '2021-07-28 18:19:24', -1);
INSERT INTO `booking` VALUES ('haruki@qq.com', 11, '2021-07-28 18:22:05', '2021-07-28 18:22:22', 0);
INSERT INTO `booking` VALUES ('haruki@qq.com', 2, '2021-07-29 16:11:25', NULL, 1);
COMMIT;

-- ----------------------------
-- Table structure for fine_log
-- ----------------------------
DROP TABLE IF EXISTS `fine_log`;
CREATE TABLE `fine_log` (
  `user_email` varchar(30) NOT NULL,
  `book_id` int NOT NULL,
  `lend_time` datetime NOT NULL,
  `return_time` datetime DEFAULT NULL,
  `fine_amount` decimal(7,2) DEFAULT NULL,
  `pay_situ` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_email`,`book_id`,`lend_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- ----------------------------
-- Records of fine_log
-- ----------------------------
BEGIN;
INSERT INTO `fine_log` VALUES ('haruki@qq.com', 2, '2021-07-28 17:37:08', '2021-07-28 18:14:27', 193.05, 0);
COMMIT;

-- ----------------------------
-- Table structure for lend
-- ----------------------------
DROP TABLE IF EXISTS `lend`;
CREATE TABLE `lend` (
  `user_email` varchar(30) NOT NULL,
  `book_id` int NOT NULL,
  `lending_time` datetime DEFAULT CURRENT_TIMESTAMP,
  `return_time` datetime DEFAULT NULL,
  `rest_num` int DEFAULT '5',
  PRIMARY KEY (`user_email`,`book_id`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `lend_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON UPDATE CASCADE,
  CONSTRAINT `lend_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of lend
-- ----------------------------
BEGIN;
INSERT INTO `lend` VALUES ('haruki@qq.com', 11, '2021-07-28 18:22:22', '2021-09-15 18:22:22', 0);
COMMIT;

-- ----------------------------
-- Table structure for lend_history
-- ----------------------------
DROP TABLE IF EXISTS `lend_history`;
CREATE TABLE `lend_history` (
  `user_email` varchar(30) NOT NULL,
  `book_id` int NOT NULL,
  `lending_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `return_time` datetime DEFAULT NULL,
  PRIMARY KEY (`user_email`,`book_id`,`lending_time`),
  KEY `book_id` (`book_id`),
  CONSTRAINT `lend_history_ibfk_1` FOREIGN KEY (`user_email`) REFERENCES `user` (`user_email`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `lend_history_ibfk_2` FOREIGN KEY (`book_id`) REFERENCES `book` (`book_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of lend_history
-- ----------------------------
BEGIN;
INSERT INTO `lend_history` VALUES ('haruki@qq.com', 5, '2021-07-28 18:04:11', '2021-07-28 20:15:36');
COMMIT;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_email` varchar(30) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `rest_lend_num` int DEFAULT '20',
  `phone_num` char(15) DEFAULT NULL,
  `is_admin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`user_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- ----------------------------
-- Records of user
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('12', '1233', '123', 20, NULL, 1);
INSERT INTO `user` VALUES ('123@qq.com', 'ShokuhouMisaki', '345678', 20, '363738391', 1);
INSERT INTO `user` VALUES ('456@qq.com', 'Index', '910JQK', 20, '213454535', 0);
INSERT INTO `user` VALUES ('haruki11@qq.com', 'harukitest', 'haruki', 20, NULL, 0);
INSERT INTO `user` VALUES ('haruki@qq.com', 'haruki9', 'haruki', 0, '1231203811', 0);
INSERT INTO `user` VALUES ('hsadaruki@qq.com', '1', '1', 20, NULL, 0);
INSERT INTO `user` VALUES ('isl@stu.xmu.edu.cn', 'user2', '654321', 20, '324242342', 0);
INSERT INTO `user` VALUES ('sasa@163.com', 'user3', '111111', 20, '788976534', 0);
COMMIT;

-- ----------------------------
-- Triggers structure for table book
-- ----------------------------
DROP TRIGGER IF EXISTS `book_del`;
delimiter ;;
CREATE TRIGGER `book_del` AFTER DELETE ON `book` FOR EACH ROW begin
  insert into libtest.book_rubbish_bin
  values(old.book_id, old.book_name, old.book_auth, old.book_pub, old.ISBN, old.book_pric, old.book_intro);
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table booking
-- ----------------------------
DROP TRIGGER IF EXISTS `DealBooking`;
delimiter ;;
CREATE TRIGGER `DealBooking` AFTER UPDATE ON `booking` FOR EACH ROW begin
	if new.STATUS = 0 THEN	
		insert into libtest.lend(user_email, book_id)
		values
		(new.user_email, new.book_id);
	ELSEIF new.STATUS = -1 THEN
		update book
		set in_library = TRUE
		where book_id = new.book_id;
	END if;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table booking
-- ----------------------------
DROP TRIGGER IF EXISTS `Booking`;
delimiter ;;
CREATE TRIGGER `Booking` AFTER INSERT ON `booking` FOR EACH ROW begin
		update book
		set in_library = FALSE
		where book_id = new.book_id;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table lend
-- ----------------------------
DROP TRIGGER IF EXISTS `book_lend`;
delimiter ;;
CREATE TRIGGER `book_lend` BEFORE INSERT ON `lend` FOR EACH ROW begin
  if new.return_time is null then
    set new.return_time = date_add(new.lending_time, interval 2 week);
  end if;
  update book
  set in_library = false
  where book_id = new.book_id;
  update user
  set rest_lend_num=rest_lend_num-1
    where user_email=new.user_email;
end
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table lend
-- ----------------------------
DROP TRIGGER IF EXISTS `book_recv`;
delimiter ;;
CREATE TRIGGER `book_recv` BEFORE DELETE ON `lend` FOR EACH ROW begin
  insert into libtest.lend_history
  values
  (old.user_email, old.book_id, old.lending_time, now());
  update book
  set in_library = true
  where book_id = old.book_id;
  if convert(now(), date) > convert(old.return_time, date) then
    insert into fine_log
    values(old.user_email, old.book_id, old.lending_time, now(), datediff(convert(now(), date), convert(old.return_time, date)) * 0.55, 0);
  end if;
  update user
  set rest_lend_num=rest_lend_num+1
  where user_email=old.user_email;
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
<<<<<<< HEAD
>>>>>>> 4a494f81e90d166f17a8b0cabaab68fd12698b0a
=======
>>>>>>> ca65eb0be759ba9db93549e30143330123b57611
