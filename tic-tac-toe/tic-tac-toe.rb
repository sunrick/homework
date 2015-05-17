require 'pry'
require './human'
require './game'
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

def play_again?
  question = "Want to play the same game (s), new game (n), or quit (q)?"
  regex = /^[snq]$/
  user_input = get_input(question, regex)
end

def tic_tac_toe(game)
  game.show_board
  until game.finished?
    game.choose_move
    game.show_board
  end
end

def play_game
  if play?
    game = TicTacToe.new
    tic_tac_toe(game)
    play_type = play_again?
    while play_type != "Q"
      if play_type == "S"
        puts dash_line
        puts "Okay let's play again!"
        puts dash_line
        game.reset
        tic_tac_toe(game)
      elsif play_type == "N"
        puts dash_line
        puts "Okay let's play a new game!"
        puts dash_line
        game = TicTacToe.new
        tic_tac_toe(game)
      end
      play_type = play_again?
    end
    puts dash_line
    puts "Thanks for playing!"
    puts dash_line
  else
    puts dash_line
    puts "FINE!"
    puts dash_line
  end
end

play_game




