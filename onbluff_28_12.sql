-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.21-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for bluff
DROP DATABASE IF EXISTS `bluff`;
CREATE DATABASE IF NOT EXISTS `bluff` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `bluff`;

-- Dumping structure for procedure bluff.clean_board
DROP PROCEDURE IF EXISTS `clean_board`;
DELIMITER //
CREATE PROCEDURE `clean_board`()
BEGIN
DELETE FROM game_board;
call start_new();
END//
DELIMITER ;

-- Dumping structure for table bluff.game_board
DROP TABLE IF EXISTS `game_board`;
CREATE TABLE IF NOT EXISTS `game_board` (
  `id` tinyint(4) NOT NULL,
  `value_tinyinit` tinyint(4) DEFAULT NULL,
  `value_text` char(5) DEFAULT NULL,
  `value_symbol` char(2) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `suit_text` char(8) DEFAULT NULL,
  `suit_color` char(5) DEFAULT NULL,
  `played_by` mediumtext DEFAULT NULL,
  `turn_name` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  CONSTRAINT `playcards_fk_id` FOREIGN KEY (`id`) REFERENCES `playcards_old` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bluff.game_board: ~0 rows (approximately)
/*!40000 ALTER TABLE `game_board` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_board` ENABLE KEYS */;

-- Dumping structure for table bluff.game_board_buffer
DROP TABLE IF EXISTS `game_board_buffer`;
CREATE TABLE IF NOT EXISTS `game_board_buffer` (
  `id` tinyint(4) NOT NULL,
  `value_tinyinit` tinyint(4) DEFAULT NULL,
  `value_text` char(5) DEFAULT NULL,
  `value_symbol` char(2) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `suit_text` char(8) DEFAULT NULL,
  `suit_color` char(5) DEFAULT NULL,
  `played_by` mediumtext DEFAULT NULL,
  `turn_name` tinytext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  CONSTRAINT `game_board_buffer_ibfk_1` FOREIGN KEY (`id`) REFERENCES `playcards_old` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table bluff.game_board_buffer: ~0 rows (approximately)
/*!40000 ALTER TABLE `game_board_buffer` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_board_buffer` ENABLE KEYS */;

-- Dumping structure for table bluff.game_board_empty
DROP TABLE IF EXISTS `game_board_empty`;
CREATE TABLE IF NOT EXISTS `game_board_empty` (
  `id` tinyint(4) DEFAULT NULL,
  `value_tinyinit` tinyint(4) DEFAULT NULL,
  `value_text` char(5) DEFAULT NULL,
  `value_symbol` char(2) DEFAULT NULL,
  `suit_symbol` char(1) DEFAULT NULL,
  `suit_text` char(8) DEFAULT NULL,
  `suit_color` char(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bluff.game_board_empty: ~0 rows (approximately)
/*!40000 ALTER TABLE `game_board_empty` DISABLE KEYS */;
/*!40000 ALTER TABLE `game_board_empty` ENABLE KEYS */;

-- Dumping structure for table bluff.game_status
DROP TABLE IF EXISTS `game_status`;
CREATE TABLE IF NOT EXISTS `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL,
  `p_turn` enum('A','B') DEFAULT NULL,
  `result` mediumtext DEFAULT NULL,
  `last_change` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bluff.game_status: ~0 rows (approximately)
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
	('started', 'A', NULL, '2022-12-22 22:25:01');
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;

-- Dumping structure for table bluff.hands
DROP TABLE IF EXISTS `hands`;
CREATE TABLE IF NOT EXISTS `hands` (
  `id` tinyint(4) NOT NULL,
  `value_tinyinit` tinyint(4) DEFAULT NULL,
  `value_text` char(5) DEFAULT NULL,
  `value_symbol` char(2) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `suit_text` char(8) DEFAULT NULL,
  `suit_color` char(5) DEFAULT NULL,
  `player_us` mediumtext DEFAULT NULL,
  `turn_name` tinytext DEFAULT 'NTN',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table bluff.hands: ~52 rows (approximately)
/*!40000 ALTER TABLE `hands` DISABLE KEYS */;
INSERT INTO `hands` (`id`, `value_tinyinit`, `value_text`, `value_symbol`, `img`, `suit_text`, `suit_color`, `player_us`, `turn_name`) VALUES
	(1, 1, 'ace', 'A', './img/1.png', 'hearts', 'red', 'bozo', 'A'),
	(2, 2, 'two', '2', './img/2.png', 'hearts', 'red', 'bozo', 'A'),
	(3, 3, 'three', '3', './img/3.png', 'hearts', 'red', 'bozo', 'A'),
	(4, 4, 'four', '4', './img/4.png', 'hearts', 'red', 'bozo', 'A'),
	(5, 5, 'five', '5', './img/5.png', 'hearts', 'red', 'bozo', 'A'),
	(6, 6, 'six', '6', './img/6.png', 'hearts', 'red', 'bozo', 'A'),
	(7, 7, 'seven', '7', './img/7.png', 'hearts', 'red', 'tnschr', 'B'),
	(8, 8, 'eight', '8', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\8.png', 'hearts', 'red', 'bozo', 'A'),
	(9, 9, 'nine', '9', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\9.png', 'hearts', 'red', 'bozo', 'A'),
	(10, 10, 'ten', '10', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\10.png', 'hearts', 'red', 'tnschr', 'B'),
	(11, 11, 'jack', 'J', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\11.png', 'hearts', 'red', 'tnschr', 'B'),
	(12, 12, 'queen', 'Q', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\12.png', 'hearts', 'red', 'bozo', 'A'),
	(13, 13, 'king', 'K', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\13.png', 'hearts', 'red', 'tnschr', 'B'),
	(14, 1, 'ace', 'A', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\14.png', 'diamonds', 'red', 'bozo', 'A'),
	(15, 2, 'two', '2', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\15.png', 'diamonds', 'red', 'tnschr', 'B'),
	(16, 3, 'three', '3', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\16.png', 'diamonds', 'red', 'bozo', 'A'),
	(17, 4, 'four', '4', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\17.png', 'diamonds', 'red', 'bozo', 'A'),
	(18, 5, 'five', '5', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\18.png', 'diamonds', 'red', 'bozo', 'A'),
	(19, 6, 'six', '6', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\19.png', 'diamonds', 'red', 'bozo', 'A'),
	(20, 7, 'seven', '7', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\20.png', 'diamonds', 'red', 'bozo', 'A'),
	(21, 8, 'eight', '8', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\21.png', 'diamonds', 'red', 'bozo', 'A'),
	(22, 9, 'nine', '9', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\22.png', 'diamonds', 'red', 'tnschr', 'B'),
	(23, 10, 'ten', '10', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\23.png', 'diamonds', 'red', 'bozo', 'A'),
	(24, 11, 'jack', 'J', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\24.png', 'diamonds', 'red', 'bozo', 'A'),
	(25, 12, 'queen', 'Q', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\25.png', 'diamonds', 'red', 'bozo', 'A'),
	(26, 13, 'king', 'K', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\26.png', 'diamonds', 'red', 'bozo', 'A'),
	(27, 1, 'ace', 'A', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\27.png', 'clubs', 'black', 'tnschr', 'B'),
	(28, 2, 'two', '2', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\28.png', 'clubs', 'black', 'tnschr', 'B'),
	(29, 3, 'three', '3', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\29.png', 'clubs', 'black', 'tnschr', 'B'),
	(30, 4, 'four', '4', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\30.png', 'clubs', 'black', 'tnschr', 'B'),
	(31, 5, 'five', '5', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\31.png', 'clubs', 'black', 'bozo', 'A'),
	(32, 6, 'six', '6', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\32.png', 'clubs', 'black', 'bozo', 'A'),
	(33, 7, 'seven', '7', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\33.png', 'clubs', 'black', 'bozo', 'A'),
	(34, 8, 'eight', '8', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\34.png', 'clubs', 'black', 'bozo', 'A'),
	(35, 9, 'nine', '9', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\35.png', 'clubs', 'black', 'bozo', 'A'),
	(36, 10, 'ten', '10', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\36.png', 'clubs', 'black', 'bozo', 'A'),
	(37, 11, 'jack', 'J', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\37.png', 'clubs', 'black', 'tnschr', 'B'),
	(38, 12, 'queen', 'Q', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\38.png', 'clubs', 'black', 'bozo', 'A'),
	(39, 13, 'king', 'K', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\39.png', 'clubs', 'black', 'bozo', 'A'),
	(40, 1, 'ace', 'A', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\40.png', 'spades', 'black', 'tnschr', 'B'),
	(41, 2, 'two', '2', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\41.png', 'spades', 'black', 'tnschr', 'B'),
	(42, 3, 'three', '3', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\42.png', 'spades', 'black', 'bozo', 'A'),
	(43, 4, 'four', '4', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\43.png', 'spades', 'black', 'tnschr', 'B'),
	(44, 5, 'five', '5', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\44.png', 'spades', 'black', 'bozo', 'A'),
	(45, 6, 'six', '6', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\45.png', 'spades', 'black', 'bozo', 'A'),
	(46, 7, 'seven', '7', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\46.png', 'spades', 'black', 'bozo', 'A'),
	(47, 8, 'eight', '8', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\47.png', 'spades', 'black', 'bozo', 'A'),
	(48, 9, 'nine', '9', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\48.png', 'spades', 'black', 'bozo', 'A'),
	(49, 10, 'ten', '10', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\49.png', 'spades', 'black', 'bozo', 'A'),
	(50, 11, 'jack', 'J', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\50.png', 'spades', 'black', 'bozo', 'A'),
	(51, 12, 'queen', 'Q', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\51.png', 'spades', 'black', 'bozo', 'A'),
	(52, 13, 'king', 'K', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\52.png', 'spades', 'black', 'tnschr', 'B');
/*!40000 ALTER TABLE `hands` ENABLE KEYS */;

-- Dumping structure for table bluff.playcards
DROP TABLE IF EXISTS `playcards`;
CREATE TABLE IF NOT EXISTS `playcards` (
  `id` tinyint(4) NOT NULL,
  `value_tinyinit` tinyint(4) DEFAULT NULL,
  `value_text` char(5) DEFAULT NULL,
  `value_symbol` char(2) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `suit_text` char(8) DEFAULT NULL,
  `suit_color` char(5) DEFAULT NULL,
  `player_us` mediumtext DEFAULT NULL,
  `turn_name` tinytext DEFAULT 'NTN',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table bluff.playcards: ~52 rows (approximately)
/*!40000 ALTER TABLE `playcards` DISABLE KEYS */;
INSERT INTO `playcards` (`id`, `value_tinyinit`, `value_text`, `value_symbol`, `img`, `suit_text`, `suit_color`, `player_us`, `turn_name`) VALUES
	(1, 1, 'ace', 'A', './img/1.png', 'hearts', 'red', 'NP', 'NTN'),
	(2, 2, 'two', '2', './img/2.png', 'hearts', 'red', 'NP', 'NTN'),
	(3, 3, 'three', '3', './img/3.png', 'hearts', 'red', 'NP', 'NTN'),
	(4, 4, 'four', '4', './img/4.png', 'hearts', 'red', 'NP', 'NTN'),
	(5, 5, 'five', '5', './img/5.png', 'hearts', 'red', 'NP', 'NTN'),
	(6, 6, 'six', '6', './img/6.png', 'hearts', 'red', 'NP', 'NTN'),
	(7, 7, 'seven', '7', './img/7.png', 'hearts', 'red', 'NP', 'NTN'),
	(8, 8, 'eight', '8', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\8.png', 'hearts', 'red', 'NP', 'NTN'),
	(9, 9, 'nine', '9', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\9.png', 'hearts', 'red', 'NP', 'NTN'),
	(10, 10, 'ten', '10', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\10.png', 'hearts', 'red', 'NP', 'NTN'),
	(11, 11, 'jack', 'J', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\11.png', 'hearts', 'red', 'NP', 'NTN'),
	(12, 12, 'queen', 'Q', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\12.png', 'hearts', 'red', 'NP', 'NTN'),
	(13, 13, 'king', 'K', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\13.png', 'hearts', 'red', 'NP', 'NTN'),
	(14, 1, 'ace', 'A', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\14.png', 'diamonds', 'red', 'NP', 'NTN'),
	(15, 2, 'two', '2', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\15.png', 'diamonds', 'red', 'NP', 'NTN'),
	(16, 3, 'three', '3', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\16.png', 'diamonds', 'red', 'NP', 'NTN'),
	(17, 4, 'four', '4', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\17.png', 'diamonds', 'red', 'NP', 'NTN'),
	(18, 5, 'five', '5', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\18.png', 'diamonds', 'red', 'NP', 'NTN'),
	(19, 6, 'six', '6', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\19.png', 'diamonds', 'red', 'NP', 'NTN'),
	(20, 7, 'seven', '7', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\20.png', 'diamonds', 'red', 'NP', 'NTN'),
	(21, 8, 'eight', '8', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\21.png', 'diamonds', 'red', 'NP', 'NTN'),
	(22, 9, 'nine', '9', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\22.png', 'diamonds', 'red', 'NP', 'NTN'),
	(23, 10, 'ten', '10', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\23.png', 'diamonds', 'red', 'NP', 'NTN'),
	(24, 11, 'jack', 'J', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\24.png', 'diamonds', 'red', 'NP', 'NTN'),
	(25, 12, 'queen', 'Q', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\25.png', 'diamonds', 'red', 'NP', 'NTN'),
	(26, 13, 'king', 'K', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\26.png', 'diamonds', 'red', 'NP', 'NTN'),
	(27, 1, 'ace', 'A', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\27.png', 'clubs', 'black', 'NP', 'NTN'),
	(28, 2, 'two', '2', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\28.png', 'clubs', 'black', 'NP', 'NTN'),
	(29, 3, 'three', '3', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\29.png', 'clubs', 'black', 'NP', 'NTN'),
	(30, 4, 'four', '4', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\30.png', 'clubs', 'black', 'NP', 'NTN'),
	(31, 5, 'five', '5', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\31.png', 'clubs', 'black', 'NP', 'NTN'),
	(32, 6, 'six', '6', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\32.png', 'clubs', 'black', 'NP', 'NTN'),
	(33, 7, 'seven', '7', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\33.png', 'clubs', 'black', 'NP', 'NTN'),
	(34, 8, 'eight', '8', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\34.png', 'clubs', 'black', 'NP', 'NTN'),
	(35, 9, 'nine', '9', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\35.png', 'clubs', 'black', 'NP', 'NTN'),
	(36, 10, 'ten', '10', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\36.png', 'clubs', 'black', 'NP', 'NTN'),
	(37, 11, 'jack', 'J', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\37.png', 'clubs', 'black', 'NP', 'NTN'),
	(38, 12, 'queen', 'Q', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\38.png', 'clubs', 'black', 'NP', 'NTN'),
	(39, 13, 'king', 'K', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\39.png', 'clubs', 'black', 'NP', 'NTN'),
	(40, 1, 'ace', 'A', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\40.png', 'spades', 'black', 'NP', 'NTN'),
	(41, 2, 'two', '2', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\41.png', 'spades', 'black', 'NP', 'NTN'),
	(42, 3, 'three', '3', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\42.png', 'spades', 'black', 'NP', 'NTN'),
	(43, 4, 'four', '4', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\43.png', 'spades', 'black', 'NP', 'NTN'),
	(44, 5, 'five', '5', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\44.png', 'spades', 'black', 'NP', 'NTN'),
	(45, 6, 'six', '6', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\45.png', 'spades', 'black', 'NP', 'NTN'),
	(46, 7, 'seven', '7', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\46.png', 'spades', 'black', 'NP', 'NTN'),
	(47, 8, 'eight', '8', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\47.png', 'spades', 'black', 'NP', 'NTN'),
	(48, 9, 'nine', '9', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\48.png', 'spades', 'black', 'NP', 'NTN'),
	(49, 10, 'ten', '10', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\49.png', 'spades', 'black', 'NP', 'NTN'),
	(50, 11, 'jack', 'J', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\50.png', 'spades', 'black', 'NP', 'NTN'),
	(51, 12, 'queen', 'Q', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\51.png', 'spades', 'black', 'NP', 'NTN'),
	(52, 13, 'king', 'K', 'C:\\Users\\Thanos\\Documents\\GitHub\\ADISE22_onBluff\\www\\img\\52.png', 'spades', 'black', 'NP', 'NTN');
/*!40000 ALTER TABLE `playcards` ENABLE KEYS */;

-- Dumping structure for table bluff.playcards_old
DROP TABLE IF EXISTS `playcards_old`;
CREATE TABLE IF NOT EXISTS `playcards_old` (
  `id` tinyint(4) NOT NULL,
  `value_tinyinit` tinyint(4) DEFAULT NULL,
  `value_text` char(5) DEFAULT NULL,
  `value_symbol` char(2) DEFAULT NULL,
  `img` text DEFAULT NULL,
  `suit_text` char(8) DEFAULT NULL,
  `suit_color` char(5) DEFAULT NULL,
  `player_us` mediumtext DEFAULT NULL,
  `turn_name` tinytext DEFAULT 'NTN',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bluff.playcards_old: ~52 rows (approximately)
/*!40000 ALTER TABLE `playcards_old` DISABLE KEYS */;
INSERT INTO `playcards_old` (`id`, `value_tinyinit`, `value_text`, `value_symbol`, `img`, `suit_text`, `suit_color`, `player_us`, `turn_name`) VALUES
	(1, 1, 'ace', 'A', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(2, 2, 'two', '2', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(3, 3, 'three', '3', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(4, 4, 'four', '4', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(5, 5, 'five', '5', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(6, 6, 'six', '6', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(7, 7, 'seven', '7', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(8, 8, 'eight', '8', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(9, 9, 'nine', '9', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(10, 10, 'ten', '10', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(11, 11, 'jack', 'J', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(12, 12, 'queen', 'Q', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(13, 13, 'king', 'K', '♥', 'hearts', 'red', 'NP', 'NTN'),
	(14, 1, 'ace', 'A', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(15, 2, 'two', '2', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(16, 3, 'three', '3', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(17, 4, 'four', '4', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(18, 5, 'five', '5', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(19, 6, 'six', '6', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(20, 7, 'seven', '7', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(21, 8, 'eight', '8', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(22, 9, 'nine', '9', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(23, 10, 'ten', '10', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(24, 11, 'jack', 'J', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(25, 12, 'queen', 'Q', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(26, 13, 'king', 'K', '♦', 'diamonds', 'red', 'NP', 'NTN'),
	(27, 1, 'ace', 'A', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(28, 2, 'two', '2', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(29, 3, 'three', '3', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(30, 4, 'four', '4', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(31, 5, 'five', '5', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(32, 6, 'six', '6', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(33, 7, 'seven', '7', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(34, 8, 'eight', '8', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(35, 9, 'nine', '9', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(36, 10, 'ten', '10', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(37, 11, 'jack', 'J', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(38, 12, 'queen', 'Q', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(39, 13, 'king', 'K', '♣', 'clubs', 'black', 'NP', 'NTN'),
	(40, 1, 'ace', 'A', '♠', 'spades', 'black', 'NP', 'NTN'),
	(41, 2, 'two', '2', '♠', 'spades', 'black', 'NP', 'NTN'),
	(42, 3, 'three', '3', '♠', 'spades', 'black', 'NP', 'NTN'),
	(43, 4, 'four', '4', '♠', 'spades', 'black', 'NP', 'NTN'),
	(44, 5, 'five', '5', '♠', 'spades', 'black', 'NP', 'NTN'),
	(45, 6, 'six', '6', '♠', 'spades', 'black', 'NP', 'NTN'),
	(46, 7, 'seven', '7', '♠', 'spades', 'black', 'NP', 'NTN'),
	(47, 8, 'eight', '8', '♠', 'spades', 'black', 'NP', 'NTN'),
	(48, 9, 'nine', '9', '♠', 'spades', 'black', 'NP', 'NTN'),
	(49, 10, 'ten', '10', '♠', 'spades', 'black', 'NP', 'NTN'),
	(50, 11, 'jack', 'J', '♠', 'spades', 'black', 'NP', 'NTN'),
	(51, 12, 'queen', 'Q', '♠', 'spades', 'black', 'NP', 'NTN'),
	(52, 13, 'king', 'K', '♠', 'spades', 'black', 'NP', 'NTN');
/*!40000 ALTER TABLE `playcards_old` ENABLE KEYS */;

-- Dumping structure for table bluff.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `username` mediumtext DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  `turn_name` enum('A','B') NOT NULL,
  `last_action` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`turn_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bluff.players: ~2 rows (approximately)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` (`username`, `token`, `turn_name`, `last_action`) VALUES
	('bozo', '313d7fb84d3ab08e5fb8bf0329281435', 'A', '2022-12-22 22:24:20'),
	('tnschr', '1ddb256dedbe5fcb5de9a084cc291494', 'B', '2022-12-22 22:25:01');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for procedure bluff.share_1st_player
DROP PROCEDURE IF EXISTS `share_1st_player`;
DELIMITER //
CREATE PROCEDURE `share_1st_player`()
BEGIN
DECLARE p1, p2 MEDIUMTEXT;

SELECT username, turn_name INTO p1, p2
FROM players LIMIT 1;

UPDATE hands
SET player_us = p1, turn_name = p2
ORDER BY RAND() LIMIT 26;

CALL share_2nd_player();

END//
DELIMITER ;

-- Dumping structure for procedure bluff.share_2nd_player
DROP PROCEDURE IF EXISTS `share_2nd_player`;
DELIMITER //
CREATE PROCEDURE `share_2nd_player`()
BEGIN
DECLARE  p3, p4 MEDIUMTEXT;

SELECT username, turn_name INTO p3, p4
FROM players LIMIT 1 OFFSET 1;

UPDATE hands
SET player_us = p3, turn_name = p4
WHERE player_us = 'NP';
END//
DELIMITER ;

-- Dumping structure for procedure bluff.share_cards
DROP PROCEDURE IF EXISTS `share_cards`;
DELIMITER //
CREATE PROCEDURE `share_cards`()
BEGIN
DECLARE p1 MEDIUMTEXT;

SELECT username INTO p1
FROM players LIMIT 1;

UPDATE hands
SET player_us = p1
ORDER BY RAND() LIMIT 26;

END//
DELIMITER ;

-- Dumping structure for procedure bluff.start_new
DROP PROCEDURE IF EXISTS `start_new`;
DELIMITER //
CREATE PROCEDURE `start_new`()
BEGIN
DELETE FROM hands;
INSERT INTO hands
SELECT * FROM playcards;
END//
DELIMITER ;

-- Dumping structure for procedure bluff.take_back
DROP PROCEDURE IF EXISTS `take_back`;
DELIMITER //
CREATE PROCEDURE `take_back`(
	IN `username` MEDIUMTEXT
)
BEGIN 

DECLARE p TINYTEXT;

SELECT players.turn_name INTO p
FROM players WHERE players.username=username;

INSERT INTO game_board_buffer
SELECT * FROM game_board;

DELETE FROM game_board;

UPDATE game_board_buffer
SET played_by = username, turn_name = p;

INSERT INTO hands
SELECT * FROM game_board_buffer;

DELETE FROM game_board_buffer;

END//
DELIMITER ;

-- Dumping structure for procedure bluff.throw_card
DROP PROCEDURE IF EXISTS `throw_card`;
DELIMITER //
CREATE PROCEDURE `throw_card`(
	IN `u` MEDIUMTEXT,
	IN `x1` TINYINT
)
BEGIN
		DECLARE i TINYINT;
		
		SELECT hands.id INTO i
		FROM hands WHERE hands.player_us=u AND hands.id = x1;
		
		
		
		INSERT INTO game_board 
		SELECT * FROM hands
		WHERE id = i; 
		
		DELETE FROM hands WHERE 
		id = i;
		

	
		END//
DELIMITER ;

-- Dumping structure for trigger bluff.game_status_update
DROP TRIGGER IF EXISTS `game_status_update`;
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER game_status_update BEFORE UPDATE
	ON game_status
	FOR EACH ROW BEGIN
					SET NEW.last_change = NOW();
					END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
