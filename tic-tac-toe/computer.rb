require './format'
require 'set'

class Computer

  include Format

  attr_reader :saved_moves, :name

  def initialize
    @name = self.get_name
    @saved_moves = Set.new
  end

  def get_name
    question = "What is the computer's name?"
    regex = /^\D+$/
    get_input(question, regex)
  end

  def get_move(available)
    move = available.sample
    puts dash_line
    puts "The computer #{@name} has chosen #{move}"
    puts dash_line
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