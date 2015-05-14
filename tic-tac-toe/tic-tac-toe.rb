require 'pry'
require './validation'
require '.human'
require '.computer'
require '.board'

class TicTacToe

  include Validation

  def initialize
    @play = self.play_game?
    @player1 = self.player?
    @player2 = self.player?
  end

  def play_game?
    question = "Do you want to play tic-tac-toe? y/n"
    regex = /^[yn]$/i
    user_input = ask_for_input(question, regex)
    result = user_input == "Y"
  end

  def player?
    question = "Is first player human or computer? h/c"
    regex = /^[hc]$/
    user_input = ask_for_input(question, regex)
    if user_input == "h"
      puts "First player is a human"
      result = Human.new
    else
      puts "First player is a computer"
      result = Computer.new
    end
  end

end