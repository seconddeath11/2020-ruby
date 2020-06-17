# frozen_string_literal: true

Rout = Struct.new(:name, :stops, :length, :buses, keyword_init: true) do
  def statistics(buses)
    data = []
    buses.each do |bus|
      data.append(bus.consumption * length)
    end
    data
  end
end
