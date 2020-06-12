# frozen_string_literal: true

require 'forwardable'
# List of all routes
class RoutList
  extend Forwardable
  def_delegator :@routes, :each, :each_with_index
  def initialize(routes = [])
    @routes = routes.map do |rout|
      [rout.name, rout]
    end.to_h
  end

  def add(rout)
    @routes[rout.name] = rout
  end

  def add_bus(bus)
    @routes[bus.rout].buses_all.add(bus)
  end

  def all
    @routes.values
  end

  def ids
    @routes.keys
  end

  def find_by_id(id)
    @routes[id]
  end

  def delete(number)
    @routes.delete(number)
  end
end
