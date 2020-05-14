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

  route do |r|
    r.public if opts[:serve_static]
    r.root do
      view('index')
    end

  end
end
