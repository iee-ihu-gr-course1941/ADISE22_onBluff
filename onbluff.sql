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
  `p_turn` mediumtext DEFAULT NULL,
  `result` mediumtext DEFAULT NULL,
  `last_change` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bluff.game_status: ~0 rows (approximately)
/*!40000 ALTER TABLE `game_status` DISABLE KEYS */;
INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
	('not active', NULL, 'tnschridsfgd\r\n\r\n', '2022-11-29 04:46:28');
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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- Dumping data for table bluff.hands: ~52 rows (approximately)
/*!40000 ALTER TABLE `hands` DISABLE KEYS */;
INSERT INTO `hands` (`id`, `value_tinyinit`, `value_text`, `value_symbol`, `suit_symbol`, `suit_text`, `suit_color`, `player_us`) VALUES
	(1, 1, 'ace', 'A', '♥', 'hearts', 'red', 'takis'),
	(2, 2, 'two', '2', '♥', 'hearts', 'red', 'thanos'),
	(3, 3, 'three', '3', '♥', 'hearts', 'red', 'thanos'),
	(4, 4, 'four', '4', '♥', 'hearts', 'red', 'thanos'),
	(5, 5, 'five', '5', '♥', 'hearts', 'red', 'thanos'),
	(6, 6, 'six', '6', '♥', 'hearts', 'red', 'takis'),
	(7, 7, 'seven', '7', '♥', 'hearts', 'red', 'thanos'),
	(8, 8, 'eight', '8', '♥', 'hearts', 'red', 'thanos'),
	(9, 9, 'nine', '9', '♥', 'hearts', 'red', 'thanos'),
	(10, 10, 'ten', '10', '♥', 'hearts', 'red', 'takis'),
	(11, 11, 'jack', 'J', '♥', 'hearts', 'red', 'takis'),
	(12, 12, 'queen', 'Q', '♥', 'hearts', 'red', 'takis'),
	(13, 13, 'king', 'K', '♥', 'hearts', 'red', 'takis'),
	(14, 1, 'ace', 'A', '♦', 'diamonds', 'red', 'takis'),
	(15, 2, 'two', '2', '♦', 'diamonds', 'red', 'thanos'),
	(16, 3, 'three', '3', '♦', 'diamonds', 'red', 'takis'),
	(17, 4, 'four', '4', '♦', 'diamonds', 'red', 'takis'),
	(18, 5, 'five', '5', '♦', 'diamonds', 'red', 'thanos'),
	(19, 6, 'six', '6', '♦', 'diamonds', 'red', 'takis'),
	(20, 7, 'seven', '7', '♦', 'diamonds', 'red', 'thanos'),
	(21, 8, 'eight', '8', '♦', 'diamonds', 'red', 'takis'),
	(22, 9, 'nine', '9', '♦', 'diamonds', 'red', 'thanos'),
	(23, 10, 'ten', '10', '♦', 'diamonds', 'red', 'thanos'),
	(24, 11, 'jack', 'J', '♦', 'diamonds', 'red', 'thanos'),
	(25, 12, 'queen', 'Q', '♦', 'diamonds', 'red', 'takis'),
	(26, 13, 'king', 'K', '♦', 'diamonds', 'red', 'takis'),
	(27, 1, 'ace', 'A', '♣', 'clubs', 'black', 'thanos'),
	(28, 2, 'two', '2', '♣', 'clubs', 'black', 'takis'),
	(29, 3, 'three', '3', '♣', 'clubs', 'black', 'thanos'),
	(30, 4, 'four', '4', '♣', 'clubs', 'black', 'takis'),
	(31, 5, 'five', '5', '♣', 'clubs', 'black', 'thanos'),
	(32, 6, 'six', '6', '♣', 'clubs', 'black', 'takis'),
	(33, 7, 'seven', '7', '♣', 'clubs', 'black', 'takis'),
	(34, 8, 'eight', '8', '♣', 'clubs', 'black', 'thanos'),
	(35, 9, 'nine', '9', '♣', 'clubs', 'black', 'takis'),
	(36, 10, 'ten', '10', '♣', 'clubs', 'black', 'thanos'),
	(37, 11, 'jack', 'J', '♣', 'clubs', 'black', 'takis'),
	(38, 12, 'queen', 'Q', '♣', 'clubs', 'black', 'takis'),
	(39, 13, 'king', 'K', '♣', 'clubs', 'black', 'takis'),
	(40, 1, 'ace', 'A', '♠', 'spades', 'black', 'takis'),
	(41, 2, 'two', '2', '♠', 'spades', 'black', 'thanos'),
	(42, 3, 'three', '3', '♠', 'spades', 'black', 'takis'),
	(43, 4, 'four', '4', '♠', 'spades', 'black', 'takis'),
	(44, 5, 'five', '5', '♠', 'spades', 'black', 'thanos'),
	(45, 6, 'six', '6', '♠', 'spades', 'black', 'thanos'),
	(46, 7, 'seven', '7', '♠', 'spades', 'black', 'takis'),
	(47, 8, 'eight', '8', '♠', 'spades', 'black', 'thanos'),
	(48, 9, 'nine', '9', '♠', 'spades', 'black', 'thanos'),
	(49, 10, 'ten', '10', '♠', 'spades', 'black', 'takis'),
	(50, 11, 'jack', 'J', '♠', 'spades', 'black', 'takis'),
	(51, 12, 'queen', 'Q', '♠', 'spades', 'black', 'takis'),
	(52, 13, 'king', 'K', '♠', 'spades', 'black', 'thanos');
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bluff.playcards: ~52 rows (approximately)
/*!40000 ALTER TABLE `playcards` DISABLE KEYS */;
INSERT INTO `playcards` (`id`, `value_tinyinit`, `value_text`, `value_symbol`, `suit_symbol`, `suit_text`, `suit_color`, `player_us`) VALUES
	(1, 1, 'ace', 'A', '♥', 'hearts', 'red', 'NP'),
	(2, 2, 'two', '2', '♥', 'hearts', 'red', 'NP'),
	(3, 3, 'three', '3', '♥', 'hearts', 'red', 'NP'),
	(4, 4, 'four', '4', '♥', 'hearts', 'red', 'NP'),
	(5, 5, 'five', '5', '♥', 'hearts', 'red', 'NP'),
	(6, 6, 'six', '6', '♥', 'hearts', 'red', 'NP'),
	(7, 7, 'seven', '7', '♥', 'hearts', 'red', 'NP'),
	(8, 8, 'eight', '8', '♥', 'hearts', 'red', 'NP'),
	(9, 9, 'nine', '9', '♥', 'hearts', 'red', 'NP'),
	(10, 10, 'ten', '10', '♥', 'hearts', 'red', 'NP'),
	(11, 11, 'jack', 'J', '♥', 'hearts', 'red', 'NP'),
	(12, 12, 'queen', 'Q', '♥', 'hearts', 'red', 'NP'),
	(13, 13, 'king', 'K', '♥', 'hearts', 'red', 'NP'),
	(14, 1, 'ace', 'A', '♦', 'diamonds', 'red', 'NP'),
	(15, 2, 'two', '2', '♦', 'diamonds', 'red', 'NP'),
	(16, 3, 'three', '3', '♦', 'diamonds', 'red', 'NP'),
	(17, 4, 'four', '4', '♦', 'diamonds', 'red', 'NP'),
	(18, 5, 'five', '5', '♦', 'diamonds', 'red', 'NP'),
	(19, 6, 'six', '6', '♦', 'diamonds', 'red', 'NP'),
	(20, 7, 'seven', '7', '♦', 'diamonds', 'red', 'NP'),
	(21, 8, 'eight', '8', '♦', 'diamonds', 'red', 'NP'),
	(22, 9, 'nine', '9', '♦', 'diamonds', 'red', 'NP'),
	(23, 10, 'ten', '10', '♦', 'diamonds', 'red', 'NP'),
	(24, 11, 'jack', 'J', '♦', 'diamonds', 'red', 'NP'),
	(25, 12, 'queen', 'Q', '♦', 'diamonds', 'red', 'NP'),
	(26, 13, 'king', 'K', '♦', 'diamonds', 'red', 'NP'),
	(27, 1, 'ace', 'A', '♣', 'clubs', 'black', 'NP'),
	(28, 2, 'two', '2', '♣', 'clubs', 'black', 'NP'),
	(29, 3, 'three', '3', '♣', 'clubs', 'black', 'NP'),
	(30, 4, 'four', '4', '♣', 'clubs', 'black', 'NP'),
	(31, 5, 'five', '5', '♣', 'clubs', 'black', 'NP'),
	(32, 6, 'six', '6', '♣', 'clubs', 'black', 'NP'),
	(33, 7, 'seven', '7', '♣', 'clubs', 'black', 'NP'),
	(34, 8, 'eight', '8', '♣', 'clubs', 'black', 'NP'),
	(35, 9, 'nine', '9', '♣', 'clubs', 'black', 'NP'),
	(36, 10, 'ten', '10', '♣', 'clubs', 'black', 'NP'),
	(37, 11, 'jack', 'J', '♣', 'clubs', 'black', 'NP'),
	(38, 12, 'queen', 'Q', '♣', 'clubs', 'black', 'NP'),
	(39, 13, 'king', 'K', '♣', 'clubs', 'black', 'NP'),
	(40, 1, 'ace', 'A', '♠', 'spades', 'black', 'NP'),
	(41, 2, 'two', '2', '♠', 'spades', 'black', 'NP'),
	(42, 3, 'three', '3', '♠', 'spades', 'black', 'NP'),
	(43, 4, 'four', '4', '♠', 'spades', 'black', 'NP'),
	(44, 5, 'five', '5', '♠', 'spades', 'black', 'NP'),
	(45, 6, 'six', '6', '♠', 'spades', 'black', 'NP'),
	(46, 7, 'seven', '7', '♠', 'spades', 'black', 'NP'),
	(47, 8, 'eight', '8', '♠', 'spades', 'black', 'NP'),
	(48, 9, 'nine', '9', '♠', 'spades', 'black', 'NP'),
	(49, 10, 'ten', '10', '♠', 'spades', 'black', 'NP'),
	(50, 11, 'jack', 'J', '♠', 'spades', 'black', 'NP'),
	(51, 12, 'queen', 'Q', '♠', 'spades', 'black', 'NP'),
	(52, 13, 'king', 'K', '♠', 'spades', 'black', 'NP');
/*!40000 ALTER TABLE `playcards` ENABLE KEYS */;

-- Dumping structure for table bluff.players
DROP TABLE IF EXISTS `players`;
CREATE TABLE IF NOT EXISTS `players` (
  `username` mediumtext DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL,
  KEY `username` (`username`(1024))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table bluff.players: ~2 rows (approximately)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` (`username`, `token`) VALUES
	('thanos', 'sdvsdvbsdv'),
	('takis', 'dfghfdghjs');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for procedure bluff.share_1st_player
DROP PROCEDURE IF EXISTS `share_1st_player`;
DELIMITER //
CREATE PROCEDURE `share_1st_player`()
BEGIN
DECLARE p1 MEDIUMTEXT;

SELECT username INTO p1
FROM players LIMIT 1;

UPDATE hands
SET player_us = p1
ORDER BY RAND() LIMIT 26;


CALL share_2nd_player;


END//
DELIMITER ;

-- Dumping structure for procedure bluff.share_2nd_player
DROP PROCEDURE IF EXISTS `share_2nd_player`;
DELIMITER //
CREATE PROCEDURE `share_2nd_player`()
BEGIN
DECLARE  p2 MEDIUMTEXT;

SELECT username INTO p2
FROM players LIMIT 1 OFFSET 1;

UPDATE hands
SET player_us = p2
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
CALL share_1st_player();
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
