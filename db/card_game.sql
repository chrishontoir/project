DROP TABLE IF EXISTS games;
DROP TABLE IF EXISTS cards_decks;
DROP TABLE IF EXISTS decks;
DROP TABLE IF EXISTS cards;
DROP TABLE IF EXISTS players;


CREATE TABLE players (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  deck_array VARCHAR(255),
  games VARCHAR(255)
);

CREATE TABLE cards (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  description VARCHAR(255),
  damage INT4,
  healing INT4,
  cost INT4,
  image VARCHAR(255)
);

CREATE TABLE decks (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  player_id INT4 REFERENCES players(id)
);

CREATE TABLE cards_decks (
  id SERIAL8 PRIMARY KEY,
  card_id INT4 REFERENCES cards(id),
  deck_id INT4 REFERENCES decks(id),
  in_hand BOOLEAN,
  played BOOLEAN,
  order_num INT8
);

CREATE TABLE games (
  id SERIAL8 PRIMARY KEY,
  date VARCHAR(255),
  player1_id INT4 REFERENCES players(id),
  player1_health INT4,
  player1_power INT4,
  player1_deck INT4 REFERENCES decks(id),
  player1_hand VARCHAR(255),
  player1_played VARCHAR(255),
  player2_id INT4 REFERENCES players(id),
  player2_health INT4,
  player2_power INT4,
  player2_deck INT4 REFERENCES decks(id),
  player2_hand VARCHAR(255),
  player2_played VARCHAR(255),
  status VARCHAR(255)
);
