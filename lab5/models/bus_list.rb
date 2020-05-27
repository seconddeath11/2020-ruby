# frozen_string_literal: true

# List of all buses
class BusList
  def initialize(buses = [])
    @buses = buses
  end

  def add(bus)
    @buses.append(bus)
  end

  def get_by_number(number)
    @buses.index { |x| x.number == number }
  end

  def remove(number)
    @buses.remove(get_by_number(number))
  end

  def by_state(state)
    @buses.select do |bus|
      next if bus.state != state

      true
    end
  end

  def find_driver(name)
    @buses.get(@buses.index { |bus| bus.name.split(' ')[0] == name }).number
  end
end
