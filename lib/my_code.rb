def map(array)
  array.length.times do |i|
    array[i] = yield(array[i])
  end
  array
end

def reduce(array, starting_value = nil)
  i = 0
  if !starting_value
    starting_value = array[0]
    i = 1
  end
  while i < array.length
    starting_value = yield(starting_value, array[i])
    i += 1
  end
  puts starting_value
end

# def reduce(array, accumulator=0)
#   for element in array
#     if ((element || accumulator) == true)
#       accumulator = yield(element, accumulator)
#     else 
#       accumulator = yield(accumulator, element)
#     end
#   end
#   accumulator
# end

#returns false when any value is false
reduce([1, 2, true, "razmatazz", false]){|memo, n| memo && n}

#returns true when a truthy value is present
reduce([ false, nil, nil, nil, true]){|memo, n| memo || n}

#returns false when no truthy value is present
reduce([ false, nil, nil, nil]){|memo, n| memo && n}

#returns true when all values are truthy
reduce([1, 2, true, "razmatazz"]){|memo, n| memo && n}

#returns a running total when not given a starting point
reduce([1,2,3]){|memo, n| memo + n}

#returns a running total when given a starting point
reduce([1, 2, 3], 100){|memo, n| memo + n}

