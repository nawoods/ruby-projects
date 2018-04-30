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
end
