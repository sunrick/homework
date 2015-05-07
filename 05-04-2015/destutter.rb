test_array = [1, 2, 3, 3, 4, 4, 3, 2, 1, 1]

def destutter_brit(seq)
	result = []
	last = nil
	seq.each do |item|
		result.push(item) unless last == item
		last = item
	end
	result
end


def destutter(seq)
  result = []
  seq.each_with_index do |item, index|
    if index == 0
  	  seq.push(item)
    else
  	  if item != seq[index - 1]
  	    seq.push(item)
  	  end
    end
  end
  result
end


destutter(test_array)