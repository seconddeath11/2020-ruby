# frozen_string_literal: true

class Train
  def initialize(number, stops = [])
    @number = number
    @stops = stops
  end
  attr_reader :number
  def add_stop(stop)
    @stops.append(stop)
  end

  def stop_count
    @stops.count
  end

  def to_s
    "#{@number} "
  end

  def show_stops
    puts "Маршрут: #{@number} Остановки:"
    @stops.each do |stop|
      puts stop.to_s
    end
  end
end
