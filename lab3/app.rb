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
    r.on 'statistics' do
      r.is do
        @year = r.params['year'] || ''
        @years = opts[:books].filter_years
        view('statistics') 
      end
    end
    r.on 'new' do
      r.get do
        view('new')
      end
      r.post do
        @params = Validator.check(r.params['name'],
                                  r.params['date'],
                                  r.params['book'])
        if @params[:errors].empty?
          opts[:books].add_book(Book.new(@params[:name],
                                         @params[:date],
                                         @params[:book]))
          r.redirect '/'
        else
          view('new')
        end
      end
    end
  end
end
