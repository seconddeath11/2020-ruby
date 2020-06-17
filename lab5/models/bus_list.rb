# frozen_string_literal: true

require 'forwardable'
# List of all buses
class BusList
  extend Forwardable
  def_delegator :@buses, :each, :each_with_index
  def initialize(buses = [])
    @buses = buses
  end

  def add(bus)
    @buses.append(bus)
    bus
  end

  def all
    @buses.dup
  end

  def numbers
    @numbers = []
    @buses.each do |bus|
      @numbers.append(bus.number)
    end
    @numbers
  end

  def delete(number)
    @buses.delete(find_by_id(number))
  end

  def by_state(number, state)
    @buses.select do |bus|
      next if bus.state != state || bus.rout != number

      true
    end
  end

  def find_by_id(id)
    @buses.each do |bus|
      next if bus.number != id

      return bus
    end
  end

  def update(old_bus, bus)
    new_bus = find_by_id(old_bus)
    bus.to_h.each do |key, value|
      new_bus[key] = value
    end
  end

  def find_driver(name)
    @buses.each do |bus|
      return bus.rout if bus.name.split[0] == name
    end
    -1
  end

  def check(number, buses)
    @buses.each do |bus|
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

  def by_number(number)
    @buses.select do |bus|
      next if bus.number != number

      true
    end
  end

  def by_rout(rout)
    @buses.select do |bus|
      next if bus.rout != rout

      true
    end
  end

  def update_rout(buses, routes)
    enum = routes.to_enum
    buses.each do |bus|
      updated = find_by_id(bus.number)
      all = enum.next[1]
      updated.rout = all['rout'].to_i
      updated.state = all['state']
    end
  end
end
