# frozen_string_literal: true

# Complex class
class MyComplex
  def initialize(real, imaginary)
    @real = real
    @imaginary = imaginary
  end

  def to_s
    "#{@real} + i*#{@imaginary}"
  end

  attr_reader :real

  attr_reader :imaginary

  attr_writer :real

  attr_writer :imaginary

  def add(new_one)
    MyComplex.new(real + new_one.real, imaginary + new_one.imaginary)
  end
end
