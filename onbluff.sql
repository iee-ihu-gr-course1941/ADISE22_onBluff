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
  `suit_symbol` char(1) DEFAULT NULL,
  `suit_text` char(8) DEFAULT NULL,
  `suit_color` char(5) DEFAULT NULL,
  `played_by` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  CONSTRAINT `playcards_fk_id` FOREIGN KEY (`id`) REFERENCES `playcards` (`id`) ON UPDATE NO ACTION
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
  `suit_symbol` char(1) DEFAULT NULL,
  `suit_text` char(8) DEFAULT NULL,
  `suit_color` char(5) DEFAULT NULL,
  `played_by` mediumtext DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id` (`id`) USING BTREE,
  CONSTRAINT `game_board_buffer_ibfk_1` FOREIGN KEY (`id`) REFERENCES `playcards` (`id`) ON UPDATE NO ACTION
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
	('started', 'A', NULL, '2022-12-13 13:12:15');
/*!40000 ALTER TABLE `game_status` ENABLE KEYS */;

-- Dumping structure for table bluff.hands
DROP TABLE IF EXISTS `hands`;
CREATE TABLE IF NOT EXISTS `hands` (
  `id` tinyint(4) NOT NULL,
  `value_tinyinit` tinyint(4) DEFAULT NULL,
  `value_text` char(5) DEFAULT NULL,
  `value_symbol` char(2) DEFAULT NULL,
  `suit_symbol` char(1) DEFAULT NULL,
  `suit_text` char(8) DEFAULT NULL,
  `suit_color` char(5) DEFAULT NULL,
  `player_us` mediumtext DEFAULT NULL,
  `turn_name` tinytext DEFAULT 'NTN',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table bluff.hands: ~52 rows (approximately)
/*!40000 ALTER TABLE `hands` DISABLE KEYS */;
INSERT INTO `hands` (`id`, `value_tinyinit`, `value_text`, `value_symbol`, `suit_symbol`, `suit_text`, `suit_color`, `player_us`, `turn_name`) VALUES
	(1, 1, 'ace', 'A', '♥', 'hearts', 'red', 'hdfloskjdhjf', 'A'),
	(2, 2, 'two', '2', '♥', 'hearts', 'red', 'hdfloskjdhjf', 'A'),
	(3, 3, 'three', '3', '♥', 'hearts', 'red', 'tnschr', 'B'),
	(4, 4, 'four', '4', '♥', 'hearts', 'red', 'hdfloskjdhjf', 'A'),
	(5, 5, 'five', '5', '♥', 'hearts', 'red', 'hdfloskjdhjf', 'A'),
	(6, 6, 'six', '6', '♥', 'hearts', 'red', 'tnschr', 'B'),
	(7, 7, 'seven', '7', '♥', 'hearts', 'red', 'hdfloskjdhjf', 'A'),
	(8, 8, 'eight', '8', '♥', 'hearts', 'red', 'tnschr', 'B'),
	(9, 9, 'nine', '9', '♥', 'hearts', 'red', 'tnschr', 'B'),
	(10, 10, 'ten', '10', '♥', 'hearts', 'red', 'hdfloskjdhjf', 'A'),
	(11, 11, 'jack', 'J', '♥', 'hearts', 'red', 'hdfloskjdhjf', 'A'),
	(12, 12, 'queen', 'Q', '♥', 'hearts', 'red', 'tnschr', 'B'),
	(13, 13, 'king', 'K', '♥', 'hearts', 'red', 'hdfloskjdhjf', 'A'),
	(14, 1, 'ace', 'A', '♦', 'diamonds', 'red', 'hdfloskjdhjf', 'A'),
	(15, 2, 'two', '2', '♦', 'diamonds', 'red', 'tnschr', 'B'),
	(16, 3, 'three', '3', '♦', 'diamonds', 'red', 'tnschr', 'B'),
	(17, 4, 'four', '4', '♦', 'diamonds', 'red', 'tnschr', 'B'),
	(18, 5, 'five', '5', '♦', 'diamonds', 'red', 'tnschr', 'B'),
	(19, 6, 'six', '6', '♦', 'diamonds', 'red', 'tnschr', 'B'),
	(20, 7, 'seven', '7', '♦', 'diamonds', 'red', 'hdfloskjdhjf', 'A'),
	(21, 8, 'eight', '8', '♦', 'diamonds', 'red', 'hdfloskjdhjf', 'A'),
	(22, 9, 'nine', '9', '♦', 'diamonds', 'red', 'tnschr', 'B'),
	(23, 10, 'ten', '10', '♦', 'diamonds', 'red', 'hdfloskjdhjf', 'A'),
	(24, 11, 'jack', 'J', '♦', 'diamonds', 'red', 'tnschr', 'B'),
	(25, 12, 'queen', 'Q', '♦', 'diamonds', 'red', 'hdfloskjdhjf', 'A'),
	(26, 13, 'king', 'K', '♦', 'diamonds', 'red', 'tnschr', 'B'),
	(27, 1, 'ace', 'A', '♣', 'clubs', 'black', 'tnschr', 'B'),
	(28, 2, 'two', '2', '♣', 'clubs', 'black', 'hdfloskjdhjf', 'A'),
	(29, 3, 'three', '3', '♣', 'clubs', 'black', 'hdfloskjdhjf', 'A'),
	(30, 4, 'four', '4', '♣', 'clubs', 'black', 'hdfloskjdhjf', 'A'),
	(31, 5, 'five', '5', '♣', 'clubs', 'black', 'tnschr', 'B'),
	(32, 6, 'six', '6', '♣', 'clubs', 'black', 'hdfloskjdhjf', 'A'),
	(33, 7, 'seven', '7', '♣', 'clubs', 'black', 'tnschr', 'B'),
	(34, 8, 'eight', '8', '♣', 'clubs', 'black', 'hdfloskjdhjf', 'A'),
	(35, 9, 'nine', '9', '♣', 'clubs', 'black', 'tnschr', 'B'),
	(36, 10, 'ten', '10', '♣', 'clubs', 'black', 'tnschr', 'B'),
	(37, 11, 'jack', 'J', '♣', 'clubs', 'black', 'hdfloskjdhjf', 'A'),
	(38, 12, 'queen', 'Q', '♣', 'clubs', 'black', 'hdfloskjdhjf', 'A'),
	(39, 13, 'king', 'K', '♣', 'clubs', 'black', 'tnschr', 'B'),
	(40, 1, 'ace', 'A', '♠', 'spades', 'black', 'hdfloskjdhjf', 'A'),
	(41, 2, 'two', '2', '♠', 'spades', 'black', 'hdfloskjdhjf', 'A'),
	(42, 3, 'three', '3', '♠', 'spades', 'black', 'hdfloskjdhjf', 'A'),
	(43, 4, 'four', '4', '♠', 'spades', 'black', 'hdfloskjdhjf', 'A'),
	(44, 5, 'five', '5', '♠', 'spades', 'black', 'tnschr', 'B'),
	(45, 6, 'six', '6', '♠', 'spades', 'black', 'tnschr', 'B'),
	(46, 7, 'seven', '7', '♠', 'spades', 'black', 'tnschr', 'B'),
	(47, 8, 'eight', '8', '♠', 'spades', 'black', 'tnschr', 'B'),
	(48, 9, 'nine', '9', '♠', 'spades', 'black', 'tnschr', 'B'),
	(49, 10, 'ten', '10', '♠', 'spades', 'black', 'tnschr', 'B'),
	(50, 11, 'jack', 'J', '♠', 'spades', 'black', 'hdfloskjdhjf', 'A'),
	(51, 12, 'queen', 'Q', '♠', 'spades', 'black', 'hdfloskjdhjf', 'A'),
	(52, 13, 'king', 'K', '♠', 'spades', 'black', 'tnschr', 'B');
/*!40000 ALTER TABLE `hands` ENABLE KEYS */;

-- Dumping structure for table bluff.playcards
DROP TABLE IF EXISTS `playcards`;
CREATE TABLE IF NOT EXISTS `playcards` (
  `id` tinyint(4) NOT NULL,
  `value_tinyinit` tinyint(4) DEFAULT NULL,
  `value_text` char(5) DEFAULT NULL,
  `value_symbol` char(2) DEFAULT NULL,
  `suit_symbol` char(1) DEFAULT NULL,
  `suit_text` char(8) DEFAULT NULL,
  `suit_color` char(5) DEFAULT NULL,
  `player_us` mediumtext DEFAULT NULL,
  `turn_name` tinytext DEFAULT 'NTN',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bluff.playcards: ~52 rows (approximately)
/*!40000 ALTER TABLE `playcards` DISABLE KEYS */;
INSERT INTO `playcards` (`id`, `value_tinyinit`, `value_text`, `value_symbol`, `suit_symbol`, `suit_text`, `suit_color`, `player_us`, `turn_name`) VALUES
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
/*!40000 ALTER TABLE `playcards` ENABLE KEYS */;

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
	('hdfloskjdhjf', '0e81cf13900ae8018c66a76776ba55be', 'A', '2022-12-13 13:12:15'),
	('tnschr', '52cc4432ac68f00e5138e9c36e829661', 'B', '2022-12-13 13:12:05');
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

INSERT INTO game_board_buffer
SELECT * FROM game_board;

DELETE FROM game_board;

UPDATE game_board_buffer
SET played_by = username;

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
