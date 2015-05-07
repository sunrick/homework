## Print a Table for a Hash

## toy = {brit: :dogs, tim: :whiskey, jo: :ping_pong}
## example: print_hash(toy)


## +------------------+
## | key  | value     |
## |------+-----------|
## | brit | dogs      |
## | tim  | whiskey   |
## | jo   | ping pong |
## +------+-----------|

=begin

toy = { brit: :dogs, :juan :question, albatross: 'huh'}
toy.keys =>  [:brit,:juan,:albatross]
toy.keys.max => :juan

option 1:

max = 0
toy.keys.each do |key|
  max = key.length if key.length > max
end

option 2:

The max method only works on numbers in an array

result = []
toy.keys.each do |key|
  result << key.length
end
result.max

exaclty the same as this:

option 3:
use map instead of manually building a result with each.
toy.keys.map { |key| key.length }.max


bloc:

do ||
  blah(x)
end

bloc:

{ |x| blah(x) }

=end

#takes an array and finds the longest value of an array
def max_length(names)
  names.map { |name| name.length }.max
end

def print_header(max_k, max_v)
  header_key_dash = max_k + 2 # 2 spaces for indentation
  header_value_dash = max_v + 2 # 2 spaces for indentation
  puts "+#{"-" * (header_key_dash)}+#{"-" * (header_value_dash)}+"
  puts "| #{"key".center(max_k)} | #{"value".center(max_v)} |"
  puts "+#{"-" * (header_key_dash)}+#{"-" * (header_value_dash)}+"
end

def print_dashes(max_k, max_v)
  total = max_k + max_v + 7 # 2 spaces for key and value, 3 spaces for pipes
  puts "-" * total
end

def print_line(key, value, max_k, max_v)
  puts "| #{key.center(max_k)} | #{value.center(max_v)} |"
end

def print_hash(hash)
  longest_key = max_length(hash.keys)
  longest_val = max_length(hash.values)
  print_header(longest_key, longest_val)
  hash.each do |key, value|
    print_line(key.to_s, value.to_s, longest_key, longest_val)
  end
  print_dashes(longest_key, longest_val)

end

print_hash(brit: :dogs, tim: :whiskey, jo: :ping_pong)