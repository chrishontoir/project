require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/players_controller.rb')
require_relative('controllers/decks_controller.rb')

get '/' do
  erb(:index)
end
