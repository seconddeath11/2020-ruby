# frozen_string_literal: true

require 'roda'
require_relative 'models'
require 'date'

# The core of the app
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
    [Book.new('Charles Dickens', '2012-02-20', 'Great Expectations', 5, 'electronic', ''),
     Book.new('Jack London', '2011-05-17', 'The people of abyss', 5, 'printed', ''),
     Book.new('Leo Tolstoy', '2025-12-19', 'The war and peace', 8, 'audio', '')]
  )
  route do |r|
    r.public if opts[:serve_static]
    r.assets
    r.root do
      @sorted_list = opts[:books].sort
      @filter = r.params['format']
      # @sorted_list = opts[:books].by_format(@filter)
      view('index')
    end
    r.on 'statistics' do
      r.is do
        @years = opts[:books].filter_years
        @year = r.params['year']
        @list_by_year = opts[:books].by_year(@year)
        @months = Date::ABBR_MONTHNAMES
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
                                  r.params['book'],
                                  r.params['mark'],
                                  r.params['size'],
                                  r.params['format'],
                                  r.params['comment'])
        if @params[:errors].empty?
          opts[:books].add_book(Book.new(@params[:name],
                                         @params[:date],
                                         @params[:book],
                                         @params[:mark],
                                         @params[:format],
                                         @params[:comment]))
          r.redirect '/'
        else
          view('new')
        end
      end
    end
  end
end
