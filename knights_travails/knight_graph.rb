class KnightGraph
  attr_accessor :squares, :edges
  
  def initialize
    create_squares
    create_edges
  end
  
  def knight_moves(start_point, end_point)
    possible_answers = [[start_point]]
    loop do
      new_possible_answers = []
      possible_answers.each do |prev_answer|
        possible_moves = edges.select { |edge| edge.include? prev_answer.last }
        possible_moves.each do |move|
          new_square = (move - [prev_answer.last])
          new_answer = prev_answer + new_square
          return new_answer if new_square.flatten == end_point
          new_possible_answers << new_answer if new_answer == new_answer.uniq
        end
      end
      possible_answers = new_possible_answers
      return "bluh" if possible_answers == []
    end
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