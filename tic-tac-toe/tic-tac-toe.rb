require 'pry'
require './human'
require './game'
require './computer'
require './board'
require './validation'
require './format'

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

def type_player?
  question = "Is the player human or computer? h/c"
  regex = /^[hc]$/
  user_input = get_input(question, regex)
  if user_input == "H"
    puts dash_line
    puts "You chose human player!"
    puts dash_line
  else
    puts dash_line
    puts "You chose computer player!"
    puts dash_line
  end
  user_input
end

def board_dimensions?
  question = "What size board do you want to play on? ex 3x3 or greater"
  regex = /^[1-9]\d*[x][1-9]\d*$/
  user_input = get_input(question, regex)
  result = user_input.split("X")
end

def create_player
  type_player = type_player?
  name = get_name
  if type_player == "H"
    player = Human.new(name)
  else
    player = Computer.new(name)
  end
  player
end

def get_name
  question = "What is your name?"
  regex = /^\D+$/
  get_input(question, regex)
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
    game = Game.new(create_player, create_player, board_dimensions?)
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




