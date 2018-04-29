def stock_picker(stocks)
  ordered_stocks = stocks.sort
  while true
    return "I would short this one actually" if ordered_stocks.length == 1
    
    low_day = stocks.find_index(ordered_stocks[0])
    hi_day = stocks.rindex(ordered_stocks[-1])
    if low_day < hi_day
      return [low_day, hi_day]
    else
      low_diff = ordered_stocks[1] - ordered_stocks[0]
      hi_diff = ordered_stocks[-1] - ordered_stocks[-2]
      if low_diff > hi_diff
        ordered_stocks.pop
      else
        ordered_stocks.shift
      end
    end
  end
end

puts stock_picker([1, 2, 3, 4, 5, 6])
puts stock_picker([8, 6, 7, 5, 3, 0, 9])
puts stock_picker([11, 5, 6, 7, 6, 9, 2, 11, 3, 2])
puts stock_picker([8, 7, 5, 3, 1])
      