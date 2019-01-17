DROP TABLE IF EXISTS games;
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
  cost INT4
);

CREATE TABLE decks (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  player_id INT4 REFERENCES players(id),
  card_1 INT4 REFERENCES cards(id),
  card_2 INT4 REFERENCES cards(id),
  card_3 INT4 REFERENCES cards(id),
  card_4 INT4 REFERENCES cards(id),
  card_5 INT4 REFERENCES cards(id),
  card_6 INT4 REFERENCES cards(id),
  card_7 INT4 REFERENCES cards(id),
  card_8 INT4 REFERENCES cards(id),
  card_9 INT4 REFERENCES cards(id),
  card_10 INT4 REFERENCES cards(id)
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
