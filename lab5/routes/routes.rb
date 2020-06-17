# frozen_string_literal: true

# the core
class App
  path :routes, '/routes'
  path :find, '/routes/find'
  path :new_rout, '/routes/new'
  path Rout do |rout, action|
    if action
      "#{rout.name}/#{action}"
    else
      "routes/#{rout.name}"
    end
  end

  hash_branch('routes') do |r|
    append_view_subdir('routes')
    set_layout_options(template: '../views/layout')
    r.is do
      @routes = opts[:routes].all
      view('routes')
    end

    r.on 'new' do
      @bad_number = false
      r.get do
        @parameters = {}
        view('new_rout')
      end

      r.post do
        @numbers = opts[:routes].ids
        @parameters = FormeWrapper.new(RoutSchema.call(r.params))
        if @parameters.success? && @numbers.include?(@parameters[:name]) == false
          opts[:routes].add(Rout.new(**@parameters.to_h))
          r.redirect('/routes')
        else
          @bad_number = if @numbers.include?(@parameters[:name])
                          true
                        else
                          false
                        end
          view('new_rout')
        end
      end
    end

    r.on 'find' do
      r.get do
        @parameters = FormeWrapper.new(DriverSchema.call(r.params))
        @number = opts[:buses].find_driver(@parameters[:driver]) if @parameters[:driver]
        view('find_driver')
      end
    end

    r.on Integer do |id|
      @rout = opts[:routes].find_by_id(id)
      next if @rout.nil?

      @buses = opts[:buses].by_rout(@rout.name).sort_by(&:number)
      r.is do
        view('rout')
      end
      r.on 'delete' do
        r.get do
          @parameters = {}
          @ids = opts[:routes].ids.sort
          @ids.delete(@rout.name)
          view('delete_rout')
        end

        r.post do
          @parameters = FormeWrapper.new(RoutDeleteSchema.call(r.params))
          if @parameters.success?
            opts[:buses].update_rout(@buses, r.params)
            opts[:routes].delete(@rout.name)
            r.redirect('/routes')
          else
            view('delete_rout')
          end
        end
      end

      r.on 'check' do
        @check = opts[:buses].check(@rout.name, @rout.buses)
        view('check_rout')
      end

      r.on 'filter' do
        r.get do
          @parameters = FormeWrapper.new(FilterBusesSchema.call(r.params))
          @filtered_buses = if @parameters.success?
                              opts[:buses].by_state(@rout.name, @parameters[:state])
                            else
                              @buses
                            end
          view('filter_rout_buses')
        end
      end

      r.on 'statistics' do
        r.get do
          @data = @rout.statistics(@buses)
          Gas.image(@buses, @data.to_enum)
          view('gas_statistics')
        end
      end
    end
  end
end
