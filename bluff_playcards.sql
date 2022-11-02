create table playcards
(
    id             tinyint                                                                                                       not null
        primary key,
    value_tinyinit tinyint                                                                                                       null,
    value_text     enum ('ace', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'ten', 'jack', 'queen', 'king') null,
    value_symbol   char(2)                                                                                                       null,
    suit_symbol    char                                                                                                          null,
    suit_text      enum ('hearts', 'diamonds', 'clubs', 'spades')                                                                null,
    suit_color     enum ('red', 'black')                                                                                         null,
    constraint playcard_id_range
        check (`id` >= 0 and `id` <= 52),
    constraint suit_symbol_not_empty
        check (!(`suit_symbol` regexp '^[[:space:]]*$')),
    constraint value_symbol_not_empty
        check (!(`value_symbol` regexp '^[[:space:]]*$')),
    constraint value_tinyinit_range
        check (`value_tinyinit` > 0 and `value_tinyinit` <= 13)
);

INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (0, null, null, null, null, null, null);
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (1, 1, 'ace', 'A', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (2, 2, 'two', '2', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (3, 3, 'three', '3', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (4, 4, 'four', '4', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (5, 5, 'five', '5', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (6, 6, 'six', '6', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (7, 7, 'seven', '7', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (8, 8, 'eight', '8', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (9, 9, 'nine', '9', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (10, 10, 'ten', '10', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (11, 11, 'jack', 'J', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (12, 12, 'queen', 'Q', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (13, 13, 'king', 'K', '♥', 'hearts', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (14, 1, 'ace', 'A', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (15, 2, 'two', '2', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (16, 3, 'three', '3', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (17, 4, 'four', '4', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (18, 5, 'five', '5', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (19, 6, 'six', '6', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (20, 7, 'seven', '7', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (21, 8, 'eight', '8', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (22, 9, 'nine', '9', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (23, 10, 'ten', '10', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (24, 11, 'jack', 'J', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (25, 12, 'queen', 'Q', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (26, 13, 'king', 'K', '♦', 'diamonds', 'red');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (27, 1, 'ace', 'A', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (28, 2, 'two', '2', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (29, 3, 'three', '3', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (30, 4, 'four', '4', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (31, 5, 'five', '5', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (32, 6, 'six', '6', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (33, 7, 'seven', '7', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (34, 8, 'eight', '8', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (35, 9, 'nine', '9', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (36, 10, 'ten', '10', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (37, 11, 'jack', 'J', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (38, 12, 'queen', 'Q', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (39, 13, 'king', 'K', '♣', 'clubs', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (40, 1, 'ace', 'A', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (41, 2, 'two', '2', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (42, 3, 'three', '3', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (43, 4, 'four', '4', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (44, 5, 'five', '5', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (45, 6, 'six', '6', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (46, 7, 'seven', '7', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (47, 8, 'eight', '8', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (48, 9, 'nine', '9', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (49, 10, 'ten', '10', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (50, 11, 'jack', 'J', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (51, 12, 'queen', 'Q', '♠', 'spades', 'black');
INSERT INTO bluff.playcards (id, value_tinyinit, value_text, value_symbol, suit_symbol, suit_text, suit_color) VALUES (52, 13, 'king', 'K', '♠', 'spades', 'black');
