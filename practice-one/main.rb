# frozen_string_literal: true

require_relative 'my_complex.rb'
require 'tty-prompt'
require 'chunky_png'

def main
  prompt = tty
  complex1 = ask_Complex(prompt)
  complex2 = ask_Complex(prompt)
  sum = complex1.add(complex2)
  puts sum
end

def tty
  prompt = TTY::Prompt.new
end

def ask_Complex(prompt)
  complex = prompt.ask('Complex number(x and y): ')
  complex_ = complex.split.map(&:to_i)
  MyComplex.new(complex_[0], complex_[1])
end
main if __FILE__ == $PROGRAM_NAME
