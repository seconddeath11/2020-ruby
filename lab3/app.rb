# frozen_string_literal: true

require 'roda'
require_relative 'models'

# ddddd
class App < Roda
  opts[:root] = __dir__
  plugin :environments
  plugin :render
  plugin :assets, css: 'books.css'

  configure :development do
    plugin :public
    opts[:serve_static] = true
  end

  opts[:books] = BookList.new(
    [Book.new('Charles Dickens', '2012-02-20', 'Great Expectations'),
     Book.new('Jack London', '2011-05-17', 'The people of abyss'),
     Book.new('Leo Tolstoy', '2025-12-19', 'The war and piece')]
  )
  route do |r|
    r.public if opts[:serve_static]
    r.assets
    r.root do
      @sorted_list = opts[:books].sort
      view('index')
    end

    r.on 'new_book' do
      view('new_book')
      @params = Validator.check(r.params['name'],
                                r.params['date'],
                                r.params['book'])

      r.post do
        @params = InputValidators.check_test(r.params['name'],
                                             r.params['date'],
                                             r.params['book'])
        if @params[:errors].empty?
          opts[:books].add_book(Test.new(@params[:name],
                                         @params[:date],
                                         @params[:book]))
          r.redirect '/'
        else
          view('new_book')
        end
      end
    end
  end
end
