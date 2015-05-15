require './format'

class Computer

  include Format

  def initialize
    @name = "Computer"
  end

  def move(available)
    result = available.sample
    puts dash_line
    puts "The #{@name} has chosen #{result}"
    puts dash_line
    result
  end

end