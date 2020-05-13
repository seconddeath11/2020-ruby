# frozen_string_literal: true

class Result
  def initialize(name1, name2, num1, num2)
    @name1 = name1
    @name2 = name2
    @num1 = num1
    @num2 = num2
  end
  attr_reader :name1, :name2, :num1, :num2

  def to_s
    "#{name1} #{name2} #{num1} #{num2}"
  end
end
