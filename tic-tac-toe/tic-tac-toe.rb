require 'pry'
require './validation'
require './human'
require './computer'
require './board'

class TicTacToe

  include Validation

  def initialize
    @board = Board.new
    @player1 = nil
    @player2 = nil
    @letter1 = "X"
    @letter2 = "O"
    @turn_count = 0
    self.play
  end

  def play
    @player1 = self.type_player?
    @player2 = self.type_player?
  end

  def type_player?
    question = "Is first player human or computer? h/c"
    regex = /^[hc]$/
    user_input = get_input(question, regex)
    if user_input == "H"
      puts "Player is a human"
      result = Human.new
    else
      puts "Player is a computer"
      result = Computer.new
    end
  end

  def choose_move
    if @turn_count.even?
      move = @player1.move(@board.valid_moves)
      @board.update(move, @letter1)
    else
      move = @player2.move(@board.valid_moves)
      @board.update(move, @letter2)
    end
    self.turn_count
  end

  def show_board
    @board.show
  end

  def turn_count
    @turn_count += 1
  end

  def win?
    
  end

  def draw?
    @board.length == @turn_count
  end

  def reset
    @board = Board.new
    @turn_count = 0
  end

end

binding.pry