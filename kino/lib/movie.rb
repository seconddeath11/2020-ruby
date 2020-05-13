# frozen_string_literal: true

class Movie
  include Comparable
  def initialize(name, c1, c2, c3, c4)
    @name = name
    @c1 = c1
    @c2 = c2
    @c3 = c3
    @c4 = c4
  end
  attr_reader :name, :c1, :c2, :c3, :c4

  def new_rating
    r = (c1 + c2 + (c3 + c4) / 2) / 3
  end

  def <=>(other)
    new_rating <=> other.new_rating
  end

  def to_s
    ["#{@name},#{@c1},#{@c2},#{@c3},#{@c4}"]
  end
end
