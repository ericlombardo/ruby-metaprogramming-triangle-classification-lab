require 'pry'
class Triangle
  attr_accessor :lengths


  def initialize(side_1, side_2, side_3)  # takes in 3 lengths
   @lengths = [side_1, side_2, side_3]    # puts all lengths in array
  end

  def kind
    if !valid_triangle?   # if it's not a valid triangle (defined below)
      raise TriangleError # throws Triangle Error (defined below)
    elsif equilateral?    # checks for what type of triangle it is
      :equilateral        # symbol for that type
    elsif isosceles?
      :isosceles
    elsif scalene?
      :scalene
    end
  end

  def equilateral?  # defines what equilateral triangle is
    @lengths.uniq.count == 1
  end

  def isosceles?    # defines what isosceles triangle is
    @lengths.uniq.count == 2
  end

  def scalene?      # # defines what scalene triangle is
    @lengths.uniq.count == 3
  end

  def valid_triangle? #=> true if valid and false if not
    @lengths.none? do |num|
      num >= (@lengths.sum.to_f / 2)
    end 
  end

  class TriangleError < StandardError # custom error that is child to StandardError class
  end
end
