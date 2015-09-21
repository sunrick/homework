require 'pry'
require './dictionary'

class Dictionary

  def initialize(file)
    @dict = []
    @used_words = []
    File.open(file, 'r') do |f|
      f.each_line do |line|
        @dict << line.chomp if line.chomp.length > 3
      end
    end
  end

  def random_word
    word = @dict.sample
    while @used_words.include?(word)
      word = @dict.sample
    end
    @used_words << word
    word
  end

end

class Computer
  def guess
    ('a' .. 'z').to_a.sample
  end
end

class Human
  def guess
    puts "Please guess a letter: "
    letter = gets.chomp.downcase
    until letter =~ /^[a-z]$/
      puts "nope. Pick a *letter*:"
      letter = gets.chomp.downcase
    end
    letter
  end
end

class Hangman

  def initialize(player)
    dict = Dictionary.new("filepath")
    @answer = dict.random_word
    @turn_count = 7 # A resonable number of turns
    @player = player
  end

  def turn
    guess = @player.guess
    @turn_count -= unless @answer.include?(guess)
  end
end


binding.pry