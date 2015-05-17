require 'pry'
require 'set'
require './validation'
require './format'

class Human

  include Validation
  include Format

  attr_reader :saved_moves, :name

  def initialize
    @name = self.get_name
    @saved_moves = Set.new
  end

  def get_name
    question = "What is your name?"
    regex = /^\D+$/
    get_input(question, regex)
  end

  def get_move(available)
    question = "Pick a move #{@name}:"
    regex = /^#{available}$/
    move = get_input(question, regex).to_i
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
