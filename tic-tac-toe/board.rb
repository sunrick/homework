require 'pry'

class Board

  attr_reader :board

  def initialize
    @board = self.create
    @board_size = 3
  end

  def create
    (1..9).to_a
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

  def dash_line
    result = "-"*80
  end

  def update(n, player_letter)
    @board[@board.index(n)] = player_letter
  end

end

binding.pry