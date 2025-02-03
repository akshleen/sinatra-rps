require "sinatra"
require "sinatra/reloader"

# Homepage
get "/" do
  erb :index
end

# Rock Route
get "/rock" do
  @player_choice = "rock"
  play_game(@player_choice)
  erb :result
end

# Paper Route
get "/paper" do
  @player_choice = "paper"
  play_game(@player_choice)
  erb :result
end

# Scissors Route
get "/scissors" do
  @player_choice = "scissors"
  play_game(@player_choice)
  erb :result
end

# Helper Method to Play the Game
def play_game(player_choice)
  choices = ["rock", "paper", "scissors"]
  @computer_choice = choices.sample

  if player_choice == @computer_choice
    @result_message = "tied"
  elsif (player_choice == "rock" && @computer_choice == "scissors") ||
        (player_choice == "paper" && @computer_choice == "rock") ||
        (player_choice == "scissors" && @computer_choice == "paper")
    @result_message = "won"
  else
    @result_message = "lost"
  end
end
