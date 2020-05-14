# frozen_string_literal: true

require 'roda'

# ddddd
class App < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:books] = BookList.new(
    [Book.new('Charles Dickens', '2012-02-20', 'Great Expectations'),
     Book.new('Jack London', '2011-05-17', 'The people ob abyss'),
     Book.new('Leo Tolstoy', '2025-12-19', 'The war and piece')]
  )
  route do |r|
    r.public if opts[:serve_static]
    r.root do
      view('index')
    end
  end
end
