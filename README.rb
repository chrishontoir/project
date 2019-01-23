# BRIEF
#
# Create a working card game that allows players to register, edit and delete accounts, create decks of cards,
# and play against other players.
#
# MVP
# - Create an assortment of cards that can be used by the players in their decks.
# - Create, edit and delete players.
# - Create, and delete decks.
# - Create, update and delete games.
# - Have working game logic that allows two players to play vs each other.
#
# Extensions
# - Implement a win condition for the game.
# - Allow users to set a profile picture.
# - Style the cards so that they look more like cards.
# - Create admin users that are able to create, edit and delete cards, unlike normal players.
#
# Future Improvements (Identified post-development)
# - Update game logic so that the game will not allow a player's health to go above 30. This would solve the
#   problem of duplicate decks always resulting in a draw.
# - Re-issue every card_deck with a new random order_num EVERY new game. At the moment, the cards in a deck
#   are given a random order_num when the deck is created, to stop players trying to build a deck in a specific
#   order which would give them an advantage. However, currently, once a deck has been made, the cards in that
#   deck will always be played in the same order.
# - After each game finishes, save all of the game data to a historical_games table that doesn't have any
#   foreign keys, which would be used as the data pulled to each player's profile game history. This would mean
#   that a player's games wouldn't be deleted from their Game history if the other player in that game deletes
#   their profile.
