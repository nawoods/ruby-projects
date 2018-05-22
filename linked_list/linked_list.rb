require './node'

class LinkedList
  attr_reader :head
  
  def initialize(head = nil)
    @head = head
  end
  
  def append(node)
    if @head.nil?
      @head = node
    else
      pointer = @head
      pointer = pointer.next_node until pointer.next_node.nil?
      pointer.next_node = node
    end
  end
  
  def prepend(node)
    node.next_node = @head if @head
    @head = node
  end
  
  def size
    return 0 if @head.nil?
    counter = 1
    pointer = head
    until pointer.next_node.nil?
      counter += 1
      pointer = pointer.next_node
    end
    counter
  end
  
  def tail
    return nil if @head.nil?
    pointer = @head
    pointer = pointer.next_node until pointer.next_node.nil?
    pointer
  end
  
  def at(index)
    pointer = @head
    index.times do
      return nil if pointer.nil?
      pointer = pointer.next_node
    end
    pointer
  end
  
  def pop
    return nil if @head.nil?
    pointer = @head
    if @head.next_node.nil?
      @head = nil
      return pointer
    end
    pointer = pointer.next_node until pointer.next_node.next_node.nil?
    result = pointer.next_node
    pointer.next_node = nil
    result
  end
  
  def contains?(data)
    pointer = @head
    until pointer.nil?
      return true if pointer.value == data
      pointer = pointer.next_node
    end
    return false
  end
  
  def find(data)
    pointer = @head
    index = 0
    until pointer.nil?
      return index if pointer.value == data
      pointer = pointer.next_node
      index += 1
    end
    return nil
  end
  
  def to_s
    pointer = @head
    result = ""
    until pointer.nil?
      result += "( #{pointer.value} ) -> "
      pointer = pointer.next_node
    end
    result + "nil"
  end
  
  def insert_at(node, index)
    pointer = @head
    if index == 0
      node.next_node = pointer
      @head = node
      return true
    end
    (index-1).times do
      return false if pointer.nil?
      pointer = pointer.next_node
    end
    node.next_node = pointer.next_node
    pointer.next_node = node
    true
  end
  
  def remove_at(index)
    return nil if @head.nil?
    pointer = @head
    if index == 0
      @head = @head.next_node
      return pointer
    end
    (index-1).times do
      return if pointer.next_node.nil?
      pointer = pointer.next_node
    end
    result = pointer.next_node
    pointer.next_node = pointer.next_node.next_node
    result
  end
end