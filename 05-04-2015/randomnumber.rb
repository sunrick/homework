# random generator program 1-100

def get_guess
	puts "Guess a number between 1 and 100:"
	gets.chomp.to_i
end

def random_number_game

  random_number = rand(100)
  user_guess = nil

  user_guess = get_guess

  until get_guess == random_number
    if user_guess > random_number
  	  puts "Guess Lower"
  	elsif user_guess < random_number
  	  puts "Guess Higher"
  	end
  	user_guess = get_guess
  end

  puts "Good job man! The number was: " + random_number.to_s
  puts "Your guess was: " + user_guess.to_s

end

random_number_game