require 'pry'
require './format'

class Board

  include Format

  def initialize
    @board_size = 4
    @board = self.create
  end

  def create
    board_size = @board_size * @board_size
    (1..board_size).to_a
  end

  def show
    puts
    board = @board
    board = board.each_slice(@board_size).to_a
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

binding.pry