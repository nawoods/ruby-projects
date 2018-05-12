def bubble_sort(array)
  bubble_sort_by(array) { |a, b| a <=> b }
end

def bubble_sort_by(array)
  loop do
    no_changes = true
    (array.length - 1).times do |i|
      next unless yield(array[i], array[i+1]) > 0
      array[i], array[i+1] = array[i+1], array[i]
      no_changes = false
    end
    break if no_changes
  end

  array
end

puts bubble_sort([8, 6, 7, 5, 3, 0, 9])
result = bubble_sort_by(["hi","hello","hey"]) do |left,right|
  left.length - right.length
end
puts result
