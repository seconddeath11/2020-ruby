# frozen_string_literal: true
require 'forwardable'
# List of all buses
class BusList
  extend Forwardable
  def_delegator :@buses, :each, :each_with_index
  def initialize(buses = [])
    @buses = buses.map do |bus|
      [bus.number, bus]
    end.to_h
  end

  def add(bus)
    @buses[bus.number] = bus
  end

  def all
    @buses.values
  end

  def numbers
    @buses.keys
  end

  def delete(number)
    @buses.delete(number)
  end

  def by_state(state)
    @buses.select do |bus|
      next if bus.state != state

      true
    end
  end

  def find_by_id(id)
    @buses[id]
  end

  def update(old_bus, bus)
    #old_bus = @buses[id]
    p old_bus
    bus.to_h.each do |key, value|
      old_bus[key] = value
    end
  end

  def find_driver(name)
    @buses.each do |_index, bus|
      return bus.number if bus.name.split[0] == name
    end
    -1
  end

  def check(number, buses)
    @buses.each do |_index, bus|
      buses -= 1 if bus.rout == number && bus.state == 'Работает'
    end
    if buses.positive?
      "Дефицит автобусов - не хватает #{buses} автобусов"
    elsif buses.zero?
      'Столько, сколько нужно'
    else
      "Избыток автобусов - #{buses} лишних"
    end
  end
end
