# frozen_string_literal: true

# List of all routes
class RoutList
  def initialize(routes = [])
    @routes = routes.map do |rout|
      [rout.name, rout]
    end.to_h
  end

  def add(rout)
    @routes[rout.name] = rout
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

  def remove(number)
    @routes.delete(number)
  end
end
