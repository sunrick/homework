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

  def number_input(question, number_range)
    puts dash_line
    puts question
    puts dash_line
    result = gets.chomp
    until number_range.include?(result.to_i)
      puts dash_line
      puts "Sorry your input is not valid..."
      puts dash_line
      result = gets.chomp
    end
    result.to_i
  end

end