def destutter(seq)
	result = []
  seq = seq.split(", ")
	last = nil
	seq.each do |item|
		result.push(item) unless last == item
		last = item
	end
	result
end

puts "Hey give me a list of numbers to destutter! Ex 1, 2, 3. Make sure format is correct"
input = gets.chomp
puts "Original array: #{input}"
puts "New array #{destutter(input).join(', ')}"