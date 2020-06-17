# frozen_string_literal: true

require 'forme'
require 'roda'
require_relative 'models'

# The core of the app
class App < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :forme
  plugin :hash_routes
  plugin :path
  plugin :render
  plugin :status_handler
  plugin :view_options

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end
  require_relative 'routes/buses.rb'
  require_relative 'routes/routes.rb'
  opts[:store] = Store.new
  opts[:buses] = opts[:store].bus_list
  opts[:routes] = opts[:store].rout_list

  status_handler(404) do
    view('not_found')
  end

  route do |r|
    r.public if opts[:serve_static]
    r.hash_branches

    r.root do
      r.redirect buses_path
    end
  end
end
