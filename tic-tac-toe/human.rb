require 'pry'
require './validation'
require './format'

class Human

  include Validation
  include Format

  def initialize
    @name = self.name
    @letter = nil
  end

  def name
    question = "What is your name?"
    regex = /^\D+$/
    get_input(question, regex)
  end

  def move(available)
    question = "Pick a move #{@name}:"
    regex = /^#{available}$/
    get_input(question, regex).to_i
  end

end

 binding.pry