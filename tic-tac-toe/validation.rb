require './format'

module Validation

  include Format

  def get_input(question, regex)
    puts dash_line
    puts question
    puts dash_line
    result = gets.chomp
    until result =~ regex
      puts dash_line
      puts "Sorry your input is not valid..."
      puts dash_line
      result = gets.chomp
    end
    result.upcase
  end

end