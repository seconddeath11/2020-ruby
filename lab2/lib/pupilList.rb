# frozen_string_literal: true

require 'csv'
require_relative 'C:\Users\novik\.vscode\2020-ruby\lab2\lib\pupil.rb'
class PupilList
  def initialize
    @pupils = []
  end
  attr_reader :pupils
  def read(path)
    pupils = PupilList.new
    csv = CSV.read(path, encoding: 'utf-8')
    csv.each do |row|
      @pupils.append(Pupil.new(row[1], row[0], row[2].split.map(&:to_i)))
    end
  end

  def each_by_class_by_mark
    last_class = '7A'
    fives = 0
    fours = 0
    threes = 0
    twos = 0
    pupils.each do |pupil|
      if !last_class <=> pupil.class_
        fives += 1 if pupil.fmark == 5
        fours += 1 if pupil.fmark == 4
        threes += 1 if pupil.fmark == 3
        twos += 1 if pupil.fmark == 2
      else

        puts "class: #{last_class} 5: #{fives} 4: #{fours} 3: #{threes} 2: #{twos}"
        last_class = pupil.class_
        fives, fours, threes, twos = 0
      end
    end
  end

  def each_by_class
    last_class = pupils[0].class_
    num = 0
    sum = 0
    pupils.each do |pupil|
      if !last_class <=> pupil.class_
        num += 1
        sum += pupil.sum
      else
        puts "class: #{last_class} number of people: #{num} average: #{sum / num}" if num != 0
        last_class = pupil.class_
        num = 0
        sum = 0
      end
    end
  end

  def change_marks(fives, fours, threes)
    pupils.each do |pupil|
      pupil.get_final_my(fives.to_i, fours.to_i, threes.to_i)
    end
    each_by_class_by_mark
  end

  def twos
    pupils.each do |pupil|
      puts pupil if pupil.fmark == 2
    end
  end

  def find_bad
    num = 0
    pupils.each do |pupil|
      pupils.each do |pupil2|
        if !pupil.isdifferent?(pupil2)
          num = 1
          puts "#{pupil}  #{pupil2}"
          end
      end
    end
    puts 'not found' if num.zero?
  end
end
