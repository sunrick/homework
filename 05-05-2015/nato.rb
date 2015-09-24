=begin
##############################################
----------------------------------------------
PROBLEM DESCRIPTION
----------------------------------------------
Write your own NATO alphabet. 
There should be a function to encode a string and decode a string. 
The encode function will take a string, replace all upper and lower case characters 
with their "NATO" equivalents and return the result. 
The decode function will take a string, replace the "NATO" characters with their 
normal letter form and return that.
----------------------------------------------
EXAMPLE
----------------------------------------------
Encoding "hello" or "Hello" from user input would return 
"helicopter echo loser loser omega"

Decoding "helicopter echo loser loser omega" would return
"Hello"

Punctuation should remain unaltered.
----------------------------------------------
LOGIC
----------------------------------------------
Create hash key value pairs 'a' => 'alpha'
Make sure input from user is downcased
----------------------------------------------
##############################################
=end

nato_alpha = {

  'a' => 'aardvark',
  'b' => 'buddy',
  'c' => 'computer',
  'd' => 'driver',
  'e' => 'earth',
  'f' => 'father',
  'g' => 'ground',
  'h' => 'heart',
  'i' => 'indigo',
  'j' => 'june',
  'k' => 'korea',
  'l' => 'liver',
  'm' => 'monster',
  'n' => 'nerd',
  'o' => 'omega',
  'p' => 'purple',
  'q' => 'question',
  'r' => 'rickard',
  's' => 'stupid',
  't' => 'tomorrow',
  'u' => 'understand',
  'v' => 'velodrome',
  'w' => 'woman',
  'x' => 'xylophone',
  'y' => 'yomomma',
  'z' => 'zebra',
  ' ' => '?'
}


def encode(hash)
  puts "Please enter your super secret message..."
  message = gets.chomp.downcase
  encoded_string = []
  message.each_char do |str|
    if hash.has_key?(str) 
      encoded_string << hash[str].upcase
    else
      encoded_string << str
    end
  end
  encoded_string.join("-")
end

def decode(hash)
  puts "Please enter your NATO encrypted message..."
  message = gets.chomp.downcase
  decoded_string =[]
  message.split("-").each do |str|
    if hash.invert.has_key?(str)
      decoded_string << hash.invert[str]
    else
      decoded_string << str
    end
  end
  decoded_string.join
end

def question(prompt, options)
  puts "Would you like to encode or decode a message? #{options.join('/')}"
  user_input = gets.chomp.downcase
  until options.include? user_input
    puts "Sorry, not a valid input... #{options.join('/')}"
    user_input = gets.chomp.downcase
  end
  user_input
end

def main(hash)
  prompt = "Would you like to encode or decode a message? ENCODE/DECODE/NOPE"
  user_input = question(prompt, ["encode","decode","nope"])
  until user_input == 'nope'
    if user_input == "encode"
      puts encode(hash)
    elsif user_input == "decode"
      puts decode(hash)
    end
    user_input = question(prompt, ["encode","decode","nope"])
  end
  puts "Ok see you later!"
end

main(nato_alpha)