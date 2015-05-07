test_array = [1, 2, 3, 3, 4, 4, 3, 2, 1, 1]

def unique_array(my_array)
  my_array.uniq!
  my_array
end

def unique_henry(seq)
  result = []
  seq.each do |item|
    result.push(item) unless new_array.include?(item)
  end
  result
end


unique_array(test_array)