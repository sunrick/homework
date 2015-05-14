module Validation

  def ask_for_input(question, regex)
    puts question
    result = gets.chomp
    until result =~ regex
      puts "Sorry your input is not valid..."
      result = gets.chomp
    end
    result.upcase
  end
  
end