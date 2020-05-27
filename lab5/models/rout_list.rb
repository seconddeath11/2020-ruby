# frozen_string_literal: true

# List of all routes
class RoutList
  def initialize(routes = [])
    @routes = routes
  end

  def add(rout)
    @routs.append(rout)
  end

  def get_by_number(number)
    @routes.index { |x| x.name == number }
  end

  def remove(number)
    @routes.remove(get_by_number(number))
  end
end
