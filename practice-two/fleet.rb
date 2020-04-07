# frozen_string_literal: true

# My comment
class Fleet
  def initialize
    @cars = []
  end

  def add(new_one)
    cars.append(new_one)
  end

  attr_reader :cars

  def load_from_file(file_name)
    require 'json'
    json_data = File.read(file_name)
    ruby_objects = JSON.parse(json_data)
    ruby_objects.each do |i|
      cars.append(Auto.new(i['mark'], i['model'], i['year'], i['consumption']))
    end
  end

  def average_cons
    average = 0
    cars.each do |i|
      average += i.gas_cons
    end
    return 0 if cars.count.zero?

    average /= cars.count
  end

  def number_by_brand(brand)
    count = 0
    cars.each do |i|
      count += 1 if i.brand.eql?(brand)
    end
    count
  end

  def number_by_model(model)
    count = 0
    cars.each do |i|
      count += 1 if i.model == model
    end
    count
  end

  def consumption_by_brand(brand)
    count = 0
    average = 0
    cars.each do |i|
      if i.brand == brand
        average += i.gas_cons
        count += 1
      end
    end
    return 0 if count.zero?

    average /= count
  end
end
