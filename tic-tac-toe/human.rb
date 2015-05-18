require 'pry'
require 'set'
require './validation'
require './format'

class Human

  include Validation
  include Format

  attr_reader :saved_moves, :name

  def initialize(name)
    @name = name
    @saved_moves = Set.new
  end

  def get_move(available)
    question = "Pick a move #{@name}:"
    move = number_input(question, available).to_i
    save_move(move)
    move
  end

  def save_move(move)
    @saved_moves << move
  end

  def reset
    @saved_moves = Set.new
  end

end
