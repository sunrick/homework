require 'minitest/autorun'
require './game'
require './computer'
require './human'
require './board'
require './validation'
require './format'

include Validation
include Format

class GameTest < MiniTest::Test

    def test_can_make_game
      game = Game.new(Human.new("Rick"),Computer.new("John"),[3,3])
      assert_instance_of Game, game
    end

    def test_human_player_can_move
      game = Game.new(Human.new("Rick"),Computer.new("John"),[3,3])
      assert game.choose_move
    end

    def test_computer_player_can_move
      game = Game.new(Computer.new("Rick"),Computer.new("John"),[3,3])
      assert game.choose_move
    end
end

class BoardTest < MiniTest::Test

  def test_can_make_a_board
    board = Board.new(3,3)
    assert_instance_of Board, board
  end

  def test_can_update_board
    board = Board.new(4,3)
    player_letter = "X"
    player_input = 5
    board.update(player_input, player_letter)
    assert board.board[4] == "X"
  end

  def test_can_get_valid_moves_left_on_board
    board = Board.new(5,110)
    board.update(5,"X")
    available_moves = board.valid_moves
    refute available_moves.include?(5)
  end

end

class ComputerTest < MiniTest::Test

  def test_computer_can_choose_move
    computer = Computer.new("John")
    assert computer.get_move([1, 2, 3, 4, 'x', 'x', 'x', 8, 9])
  end

  def test_computer_cannot_choose_move
    computer = Computer.new("John")
    refute computer.get_move([])
  end

end

class HumanTest < MiniTest::Test

  def can_create_human
    human = Human.new("Sup")
    assert_instance_of Human, human
    human = Human.new
    refute_instance_of Human, human
  end

  def test_human_can_choose_move
    human = Human.new("John")
    assert human.get_move([1, 2, 3, 4, 4, 5, 6, 8, 9])
  end

end