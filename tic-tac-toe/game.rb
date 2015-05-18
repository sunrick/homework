require 'pry'
require 'set'
require './validation'
require './human'
require './computer'
require './board'

class Game

  include Validation

  def initialize (player1, player2, board_dimensions)
    @player1 = player1
    @player2 = player2
    @letter1 = "X"
    @letter2 = "O"
    @turn_count = 0
    @num_rows = board_dimensions[0].to_i
    @num_cols = board_dimensions[1].to_i
    @board = Board.new(@num_rows, @num_cols)
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