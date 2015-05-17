require 'pry'
require 'set'
require './validation'
require './human'
require './computer'
require './board'

class TicTacToe

  include Validation

  def initialize
    @player1 = nil
    @player2 = nil
    @letter1 = "X"
    @letter2 = "O"
    @num_rows = nil
    @num_cols = nil
    @turn_count = 0
    self.play
    @board = Board.new(@num_rows, @num_cols)
  end

  def play
    @player1 = self.type_player?
    @player2 = self.type_player?
    self.board_dimensions?
  end

  def type_player?
    question = "Is the player human or computer? h/c"
    regex = /^[hc]$/
    user_input = get_input(question, regex)
    if user_input == "H"
      result = Human.new
    else
      result = Computer.new
    end
  end

  def board_dimensions?
    question = "What size board do you want to play on? ex 3x3"
    regex = /^[1-9]\d*[x][1-9]\d*$/
    user_input = get_input(question, regex)
    result = user_input.split("X")
    @num_rows = result[0].to_i
    @num_cols = result[1].to_i
  end

  def choose_move
    if @turn_count.even?
      move = @player1.get_move(@board.valid_moves)
      @board.update(move, @letter1)
    else
      move = @player2.get_move(@board.valid_moves)
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
    @board.win_combos.any? do |combo|
      if combo.to_set.subset?(@player1.saved_moves)
        puts dash_line
        puts "#{@player1.name} wins!"
        puts dash_line
        true
      elsif combo.to_set.subset?(@player2.saved_moves)
        puts dash_line
        puts "#{@player2.name} wins!"
        puts dash_line
        true
      end
    end
  end

  def draw?
    if @board.length == @turn_count
      puts dash_line
      puts "Game is a draw!"
      puts dash_line
      true
    end
  end

  def finished?
    win? || draw?
  end

  def reset
    @board = Board.new(@num_rows,@num_cols)
    @turn_count = 0
    @player1.reset
    @player2.reset
  end

end