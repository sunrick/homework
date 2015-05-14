require 'pry'

class Human

  attr_reader :player_name

  def initialize
    @player_name = self.ask_for_input("What is your name?", /^[xo]$/i)
  end

  def ask_for_input(question, regex)
    puts question
    result = gets.chomp
    until result =~ regex
      puts "Sorry your input is not valid..."
      result = gets.chomp
    end
    result.upcase
  end

  def ask_for_move(available_moves)
    question = "Pick a move #{@player_name}:"
    regex = /^#{available_moves}$/
    ask_for_input(question, regex).to_i
  end

end

 binding.pry