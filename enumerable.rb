module Enumerable
  def my_each
    for i in self
      yield(i)
    end
    self
  end

  def my_each_with_index
    for i in (0..self.length)
      yield(self[i], i)
    end
    self
  end

  def my_select
    result = []
    self.my_each { |item| result << item if yield(item) }
    result
  end
  
  def my_all?
    return self.my_all? { |item| item } if !block_given?
    self.my_each { |item| return false unless yield(item) }
    true
  end
  
  def my_any?
    return self.my_any? { |item| item } if !block_given?
    self.my_each { |item| return true if yield(item) }
    false
  end
  
  def my_none?(&block)
    !self.my_any?(&block)
  end
  
  def my_count(value = omitted = true)
    if !block_given?
      return self.my_count { true } if omitted
      return self.my_count { |item| item == value }
    end
    count = 0
    self.my_each { |item| count += 1 if yield(item) }
    count
  end
  
  def my_map(proc = omitted = true)
    result = []
    if !omitted
      self.my_each { |item| result << proc.call(item) }
    else
      self.my_each { |item| result << yield(item) }
    end
    result
  end
  
  def my_inject(initial_value = omitted = true)
    if omitted
      result = self.first
      array = self[1..-1]
    else
      result = initial_value
      array = self
    end
    array.my_each { |item| result = yield(result, item) }
    result
  end
end


def multiply_els(array)
  array.my_inject { |a, b| a * b }
end