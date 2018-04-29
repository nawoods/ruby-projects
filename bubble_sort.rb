def bubble_sort(array)
  loop do
    no_changes = true
    (array.length - 1).times do |i|
      next unless array[i] > array[i+1]
      temp = array[i+1]
      array[i+1] = array[i]
      array[i] = temp
      no_changes = false
    end
    break if no_changes
  end

  array
end

puts bubble_sort([8, 6, 7, 5, 3, 0, 9])
puts bubble_sort(('z'..'a').to_a)
