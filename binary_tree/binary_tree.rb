require './node'

class BinaryTree
  attr_accessor :root
  
  def initialize(root = nil)
    @root = root
  end
  
  def build_tree(arr)
    arr.each { |item| add_node(item) }
  end
    
  def add_node(value, parent = nil, side = nil)
    if root.nil?
      @root = Node.new(value)
      @root.parent = parent
      parent.left_child = @root if side == "left"
      parent.right_child = @root if side == "right"
    else
      if value < @root.value
        BinaryTree.new(@root.left_child).add_node(value, @root, "left")
      else
        BinaryTree.new(@root.right_child).add_node(value, @root, "right")
      end
    end
  end
  
  def breadth_first_search(value)
    queue = [@root]
    until queue.length == 0
      return queue.first if queue.first.value == value
      queue.push(queue.first.left_child) if queue.first.left_child
      queue.push(queue.first.right_child) if queue.first.right_child
      queue.shift
    end
    return nil
  end
  
  def to_s
    queue = [[@root, 0]]
    until queue.length == 0
      node = queue.first.first
      level = queue.first.last
      puts "#{node.value}, #{level} (children: #{node.left_child.value},"\
        "#{node.right_child.value})"
      puts "(parent: #{node.parent.value})" if node.parent
      if queue.first
        queue.push([node.left_child, level + 1]) if node.left_child
        queue.push([node.right_child, level + 1]) if node.right_child
      end
      queue.shift
    end
  end
end