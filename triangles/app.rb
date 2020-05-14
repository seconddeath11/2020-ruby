# frozen_string_literal: true

require 'roda'

# ddddd
class App < Roda
  opts[:root] = __dir__
  plugin :public

  route do |r|
    r.root do
      view(layout)
    end

    r.on 'hello' do
      @greeting = 'Hello with rerun???'
    end
  end
end
