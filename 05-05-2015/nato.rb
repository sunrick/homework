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


def encode(hash,message)

  encoded_string = []

  message.each_char do |str|
    if hash.has_key?(str) 
      encoded_string << hash[str].upcase
    else
      encoded_string << str
    end
  end

  encoded_string = encoded_string.join("-")
  
  puts encoded_string
  return encoded_string

end

def decode(hash,message)

  decoded_string =[]

  message = message.split("-")

  message.each do |str|
    if hash.invert.has_key?(str)
      decoded_string << hash.invert[str]
    else
      decoded_string << str
    end
  end

  decoded_string = decoded_string.join

  puts decoded_string
  return decoded_string

end


def main

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

  repeat = "y"

  while repeat == "y"
    
    puts "Would you like to encode or decode a message? ENCODE/DECODE/NOPE"
    user_input = gets.chomp.downcase

    until ["encode","decode","nope"].include? user_input
      puts "Sorry, not a valid input... Please enter ENCODE/DECODE/NOPE"
      user_input = gets.chomp.downcase
    end

    if user_input == "encode"
        puts "Please enter your super secret message..."
        user_string = gets.chomp.downcase
        encode(nato_alpha,user_string)
      elsif user_input == "decode"
        puts "Please enter your NATO encrypted message..."
        user_string = gets.chomp.downcase
        decode(nato_alpha,user_string)
      else
        puts "Ok bye..."
    end

    puts "Do you want to run the program again? Y/N"
    repeat = gets.chomp.downcase

  end

end

main