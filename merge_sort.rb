def merge_sort(arr)
  return arr if arr.length == 1
  if arr.length == 2
    return (arr[0] <= arr[1] ? arr : arr.reverse)
  end
  
  result = []
  arr1 = merge_sort(arr[0...arr.length/2])
  arr2 = merge_sort(arr[arr.length/2..-1])
  while arr1.length > 0 && arr2.length > 0
    if arr1[0] < arr2[0]
      result << arr1.shift
    else
      result << arr2.shift
    end
  end
  result + (arr1.length > 0 ? arr1 : arr2)
end