# frozen_string_literal: true

require 'chunky_png'

# creates an image
module Gas
  def self.image(buses, data)
    png = ChunkyPNG::Image.new(300, 270, ChunkyPNG::Color::WHITE)
    png.line(20, 250, 300, 250, ChunkyPNG::Color::BLACK) # x-axis
    png.line(20, 10, 20, 250, ChunkyPNG::Color::BLACK) # y-axis
    dx = 50 / buses.length
    dot = 20
    buses.each do |_bus|
      height = data.next
      png.rect(dot + dx, 250, dot + 2 * dx, 250 - height)
      dot += 150 / buses.length + 2 * dx
    end
    png.save(File.expand_path('../public/data.png', __dir__))
  end
end
