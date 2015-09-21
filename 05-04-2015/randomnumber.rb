def play
  lets_play = "Y"
  puts "Welcome to the world's best random number guessing game!"
  while lets_play == "Y"
    puts "You'll have to guess a number between 1 and whatever number you choose."
    puts "Up to what number do you want to guess?"
    number = gets.chomp
    game(number)
    puts "OK NICE YOU WIN! Want to play again? Y/N "
    lets_play = gets.chomp.upcase
  end
end

def game(number)
  puts "OK WE'RE READY TO ROCK"
  random_number = rand(1..number.to_i)
  puts "WHATS YOUR GUESS BETWEEN 1-#{number}?\n"
  guess = gets.chomp.to_i
  while guess != random_number
    if guess > random_number
      puts "HEY GUESS LOWER!"
    elsif guess < random_number
      puts "HEY GUESS HIGHER!"
    end
    guess = gets.chomp.to_i
  end
end

play