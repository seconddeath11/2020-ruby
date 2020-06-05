# frozen_string_literal: true

# the core
class App
  path :buses, '/buses'
  path :new_bus, '/buses/new'
  path Bus do |bus, action|
    "buses/#{bus.number}/#{action}"
  end

  hash_branch('buses') do |r|
    append_view_subdir('buses')
    set_layout_options(template: '../views/layout')
    r.is do
      @buses = opts[:buses].all
      view('buses')
    end

    r.on 'new' do
      r.get do
        @ids = opts[:routes].ids.sort
        @read = false
        @parameters = {}
        view('new_bus')
      end

      r.post do
        @parameters = FormeWrapper.new(BusSchema.call(r.params))
        if @parameters.success?
          opts[:buses].add(Bus.new(**@parameters.to_h))
          r.redirect('/')
        else
          view('new_bus')
        end
      end
    end
    r.on Integer do |id|
      @bus = opts[:buses].find_by_id(id)
      next if @bus.nil?

      r.on 'edit' do
        r.get do
          @parameters = @bus.to_h
          @ids = opts[:routes].ids.sort
          @read = true
          view('edit_bus')
        end

        r.post do
          @parameters = FormeWrapper.new(BusSchema.call(r.params))
          if @parameters.success?
            opts[:books].update(@bus.number, @parameters)
            r.redirect('/')
          else
            view('edit_bus')
          end
        end
      end

      r.on 'delete' do
        r.get do
          @parameters = {}
          view('delete_bus')
        end

        r.post do
          @parameters = FormeWrapper.new(BusDeleteSchema.call(r.params))
          if @parameters.success?
            opts[:buses].delete(@bus.number)
            r.redirect('/')
          else
            view('delete_bus')
          end
        end
      end
    end
  end
end
