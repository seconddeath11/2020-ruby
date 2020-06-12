# frozen_string_literal: true

require 'psych'
require_relative 'bus_list'
require_relative 'bus'
require_relative 'rout_list'
require_relative 'rout'

# Storage for all data
class Store
  attr_reader :bus_list, :rout_list

  DATA_STORE = File.expand_path('../db/routes.yaml', __dir__)

  def initialize
    @bus_list = BusList.new
    @rout_list = RoutList.new
    read_data
    at_exit { write_data }
  end

  def read_data
    return unless File.exist?(DATA_STORE)

    yaml_data = File.read(DATA_STORE)
    raw_data = Psych.load(yaml_data, symbolize_names: true)
    raw_data[:routes].each do |raw_rout|
      @rout_list.add(Rout.new(**raw_rout))
    end
    raw_data[:buses].each do |raw_bus|
      @bus_list.add(Bus.new(**raw_bus))
    end
  end

  def write_data
    raw_buses = @bus_list.all.map(&:to_h)
    raw_routes = @rout_list.all.map(&:to_h)
    yaml_data = Psych.dump({
                             buses: raw_buses,
                             routes: raw_routes
                           })
    File.write(DATA_STORE, yaml_data)
  end
end
