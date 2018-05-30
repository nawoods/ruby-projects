include './knight_vertex'

class KnightEdge
  attr_accessor :vertex1, :vertex2
  
  def initialize(vertex1, vertex2)
    @vertex1 = vertex1
    @vertex2 = vertex2
  end
  
  def include_vertex?(vertex)
    return vertex == vertex1 || vertex == vertex2 if vertex.is_a? KnightVertex
    vertex == vartex1.name || vertex == vertex2.name
  end
end