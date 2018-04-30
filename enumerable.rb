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
    if block_given?
      self.my_each { |item| return false unless yield(item) }
    else
      self.my_each { |item| return false unless item }
    end
    true
  end
  
  def my_any?
    if block_given?
      self.my_each { |item| return true if yield(item) }
    else
      self.my_each { |item| return true if item }
    end
    false
  end
  
  def my_none?(&block)
    !self.my_any?(&block)
  end
end
