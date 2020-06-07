# frozen_string_literal: true

# the core
class App
  path :routes, '/routes'
  path :new_rout, '/routes/new'
  path Rout do |rout, action|
    "routes/#{rout.name}/#{action}"
  end

  hash_branch('routes') do |r|
    append_view_subdir('routes')
    set_layout_options(template: '../views/layout')
    r.is do
      @routes = opts[:routes].all
      view('routes')
    end

    r.on 'new' do
      r.get do
        @parameters = {}
        view('new_rout')
      end

      r.post do
        @parameters = FormeWrapper.new(RoutSchema.call(r.params))
        if @parameters.success?
          opts[:routes].add(Rout.new(**@parameters.to_h))
          r.redirect('/')
        else
          view('new_rout')
        end
      end
    end

    r.on Integer do |id|
      @rout = opts[:routes].find_by_id(id)
      next if @rout.nil?

      r.on 'delete' do
        r.get do
          @parameters = {}
          view('delete_rout')
        end

        r.post do
          @parameters = FormeWrapper.new(RoutDeleteSchema.call(r.params))
          if @parameters.success?
            opts[:routes].delete(@bus.number)
            r.redirect('/')
          else
            view('delete_rout')
          end
        end
      end

      r.on 'check' do
        opts[:buses].check(@rout.name, @rout.buses)
        view('check_rout')
      end
    end
  end
end
