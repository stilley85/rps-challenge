require "sinatra/base"
require "./lib/player.rb"
require "./lib/computer.rb"
require "./lib/game.rb"

class RPS < Sinatra::Base

  before do
    @game = Game.instance
  end

  get '/' do
    erb(:index)
  end

  post "/name" do
    @game = Game.create(Player.new(params[:player_1]))
    redirect to('/play')
  end

  get '/play' do
    erb(:play)
  end

  post '/play' do
    @game.player_1.choose_move(params[:player_1_move])
    redirect('/outcome')
  end

  get '/outcome' do
    erb(:outcome)
  end

end
