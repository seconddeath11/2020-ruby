# frozen_string_literal: true

# List of all buses
class BusList
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

  def update(id, bus)
    old_bus = @buses[id]
    bus.to_h.each do |key, value|
      old_bus[key] = value
    end
  end

  def find_driver(name)
    @buses.each do |_index, bus|
      if bus.name.split()[0] == name
        return bus.number
      end
    end
  end

  def check(number, buses)
    @buses.each do |_index, bus|
      buses -= 1 if bus.rout == number
    end
    if buses.positive?
      'Not enough buses'
    elsif buses.zero?
      'Enough buses'
    else
      'Too much buses'
    end
  end
end
