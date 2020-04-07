# frozen_string_literal: true

require 'tty-prompt'

def main
  array = take_array
  p array
  solve_with_iterator(array)
  solve_with_cycle(array)
end

def take_array
  prompt = TTY::Prompt.new
  array = prompt.ask('Array: ')
  array.split.map(&:to_i)
end

def solve_with_iterator(array)
  znak = array[0]
  pos = []
  array.each_with_index do |number, index|
    if (znak * number).negative?
      pos.append(index)
      znak = number
    end
  end
  p pos
end

def solve_with_cycle(array)
  znak = array[0]
  pos = []
  i = 0
  for number in array 
    if (znak * number).negative?
      pos.append(i)
      znak = number
    end
    i += 1
  end
  p pos
end

main if __FILE__ == $PROGRAM_NAME
