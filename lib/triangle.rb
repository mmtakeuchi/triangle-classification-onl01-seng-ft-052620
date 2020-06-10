class Triangle
  attr_accessor :side_1, :side_2, :side_3, :equilateral, :isosceles, :scalene

  @@all = []

  def initialize(side_1, side_2, side_3)
    @side_1 = side_1
    @side_2 = side_2
    @side_3 = side_3
    @@all << self
  end

  def self.all
    @@all
  end

  def kind
    if (side_1 <= 0 || side_2 <= 0 || side_3 <= 0) || (side_1 + side_2 <= side_3) || (side_1 + side_3 <= side_2) || (side_2 + side_3 <= side_1)
      raise TriangleError
    elsif side_1 == side_2 && side_1 ==side_3 && side_2 == side_3
      :equilateral
    elsif side_1 == side_2 && ((side_1 || side_2) != side_3)
      :isosceles
    elsif side_1 == side_3 && ((side_1 || side_3) != side_2)
      :isosceles
    elsif side_2 == side_3 && ((side_2 || side_3) != side_1)
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
    def message
      "sides cannot be zero or negative values, and two sides must exceed the length of the third side."
    end
  end
end
