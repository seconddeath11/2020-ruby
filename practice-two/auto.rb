# frozen_string_literal: true

# class Auto
class Auto
  def initialize(brand, model, year, gas_cons)
    @brand = brand
    @model = model
    @year = year
    @gas_cons = gas_cons
  end

  attr_reader :brand

  attr_reader :model

  attr_reader :year

  attr_reader :gas_cons

  def to_s
    "#{brand} #{model} #{year} #{gas_cons}"
  end
end
