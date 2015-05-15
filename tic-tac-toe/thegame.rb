require 'pry'
require './human'
require './tic-tac-toe'
require './computer'
require './board'
require './validation'
require './Format'

include Validation
include Format

def play?
  question = "Do you want to play tic-tac-toe? y/n"
  regex = /^[yn]$/i
  user_input = get_input(question, regex)
  if user_input == "Y"
    true
  else
    false
  end
end

if play?
  game = TicTacToe.new
  game.show_board
  until game.draw?
    game.choose_move
    game.show_board
  end
else
  puts "No game"
end

binding.pry


