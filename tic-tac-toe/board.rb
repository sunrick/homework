require 'pry'
require 'set'
require './format'

class Board

  include Format

  attr_reader :win_combos

  def initialize(num_rows, num_cols)
    @num_rows = num_rows.to_i
    @num_cols = num_cols.to_i
    @board_size = @num_rows * @num_cols
    @board = self.create
    @win_combos = self.all_wins
  end

  def create
    board_size = @board_size
    (1..board_size).to_a
  end

  def horizontal_wins
    horizontal_wins = @board.each_slice(@num_cols).to_a
  end

  def vertical_wins
    result = []
    columns = (1..@num_cols).to_a
    columns.each do |x|
      result << (x..@board_size).step(@num_cols).to_a
    end
    result
  end

  def diagonal_wins
    result = []
    if @num_rows == @num_cols
      top_row = horizontal_wins[0]
      first = top_row.first
      last = top_row.last
      result << (first..@board_size).step(@num_cols+1).to_a
      result << (last..(@board_size-1)).step(@num_cols-1).to_a
      result
    end
    result
  end

  def all_wins
    result = horizontal_wins + vertical_wins + diagonal_wins
  end

  def show
    puts
    board = @board
    board = board.each_slice(@num_cols).to_a
    board.each do |row|
      puts row.join("-").center(dash_line.length)
    end
    puts
  end

  def update(move, letter)
    @board[@board.index(move)] = letter
  end

  def valid_moves
    result = @board.select { |x| x.is_a? Integer }
  end

  def length
    @board.length
  end

end
