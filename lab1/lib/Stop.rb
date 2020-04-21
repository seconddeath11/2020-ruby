# frozen_string_literal: true

class Stop
  def initialize(number, stop, arrival, duration, distance)
    @number = number
    @stop = stop
    @arrival = arrival
    @duration = duration
    @distance = distance
  end


  def to_s
    "#{@number} #{@stop} #{@arrival}"
  end
end
