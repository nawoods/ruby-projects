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
      self.root = Node.new(value)
      self.root.parent = parent
      parent.left_child = root if side == :left
      parent.right_child = root if side == :right
    else
      if value < root.value
        BinaryTree.new(root.left_child).add_node(value, root, :left)
      else
        BinaryTree.new(root.right_child).add_node(value, root, :right)
      end
    end
  end
  
  def breadth_first_search(value)
    queue = [root]
    until queue.length == 0
      return queue.first if queue.first.value == value
      queue.push(queue.first.left_child) if queue.first.left_child
      queue.push(queue.first.right_child) if queue.first.right_child
      queue.shift
    end
    return nil
  end
  
  # preorder search
  def depth_first_search(value)
    stack = [root]
    until stack.length == 0
      current_node = stack.pop
      return current_node if current_node.value == value
      stack.push(current_node.right_child) if current_node.right_child
      stack.push(current_node.left_child) if current_node.left_child
    end
    return nil
  end
  
  def to_s
    return "it's empty" if root.nil?
    result = ""
    queue = [[root, 0]]
    until queue.length == 0
      node = queue.first.first
      level = queue.first.last
      result += "#{node.value}, #{level}"
      result += "(parent: #{node.parent.value})" if node.parent
      result += "\n"
      if queue.first
        queue.push([node.left_child, level + 1]) if node.left_child
        queue.push([node.right_child, level + 1]) if node.right_child
      end
      queue.shift
    end
    result
  end
end