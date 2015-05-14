require 'minitest/autorun'
require './tic-tac-toe'
require './computer'
require './human'
require './board'


class TicTest < MiniTest::Test
end

class BoardTest < MiniTest::Test

  def test_can_make_a_board
    board = Board.new
    assert_instance_of Board, board
  end

  def test_can_update_board
    board = Board.new
    player_letter = "X"
    player_input = 5
    board.update(player_input, player_letter)
    assert board.board[4] == "X"
  end

end

class ComputerTest < MiniTest::Test
end

class HumanTest < MiniTest::Test
end