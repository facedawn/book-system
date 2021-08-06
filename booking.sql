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

 Date: 28/07/2021 17:40:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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

SET FOREIGN_KEY_CHECKS = 1;
