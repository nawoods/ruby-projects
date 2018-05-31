class KnightGraph
  attr_accessor :squares, :edges
  
  def initialize
    create_squares
    create_edges
  end
  
  def knight_moves
  end
  
  private
  
  def create_squares
    self.squares = []
    (1..8).each do |i|
      (1..8).each do |j|
        squares << [i, j]
      end
    end
  end
  
  def create_edges
    self.edges = []
    [[1,2], [2,1], [1,-2], [2,-1]].each { |i| create_edges_with_shape(i) }
  end
  
  # shape = 2-item array listing x- and y-distances between vertices
  def create_edges_with_shape(shape)
    squares.each do |square1|
      square2 = [square1.first + shape.first, square1.last + shape.last]
      next if square2.max > 8 || square2.min < 0
      edges << [square1, square2]
    end
  end
end