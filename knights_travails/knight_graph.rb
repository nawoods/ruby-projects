include './knight_edge'

class KnightGraph
  attr_accessor :vertices, :edges
  
  def initalize
    create_vertices
    crate_edges
  end
  
  private
  
  def create_vertices
    ('a'..'h').each do |letter|
      (1..8).each do |number|
        vertices << KnightVertex.new(letter + number)
      end
    end
  end
  
  def create_edges
  end
end