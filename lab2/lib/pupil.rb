# frozen_string_literal: true

class Pupil
  include Enumerable
  def initialize(name, class_, marks)
    @name = name
    @class_ = class_
    @marks = marks
    @fmark = get_final
  end
  attr_reader :class_, :marks, :fmark
  def get_final
    sum = marks.sum
    if sum > 30
      @fmark = 5
      return
    end
    if sum > 25
      @fmark = 4
      return
    end
    if sum > 20
      @fmark = 3
      return
    end
    @fmark = 2
  end

  def sum
    marks.sum
  end

  def get_final_my(five, four, three)
    if sum >= five
      @fmark = 5
      return
    end
    if sum >= four
      @fmark = 4
      return
    end
    if sum >= three
      @fmark = 3
      return
    end
    @fmark = 2
  end

  def to_s
    "#{@name} #{class_} #{sum}"
  end

  def isdifferent?(other)
    num = 0
    marks.each_with_index do |mark, index|
      num += 1 if mark != other.marks[index]
    end
    num <= 3
  end
end
