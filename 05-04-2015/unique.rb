def unique(seq)
  result = []
  seq.each do |item|
    result.push(item) unless result.include?(item)
  end
  result
end

puts "Hey give me a list of numbers to make unique! Ex 1, 2, 3. Make sure format is correct"
input = gets.chomp
puts "Original array: #{input}"
puts "New array #{unique(input.split(", ")).join(', ')}"


