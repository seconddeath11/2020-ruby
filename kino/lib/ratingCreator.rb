# frozen_string_literal: true

require 'optparse'
require_relative 'C:\Users\novik\.vscode\2020-ruby\kino\lib\movies.rb'
class RatingCreator
  def create
    movies = Movies.new
    files = read
    movies.read_data(files[0])
    movies.save_sorted(files[1])
  end

  def read
    current_path = 'C:/Users/novik/.vscode/2020-ruby/kino/'
    optparser = OptionParser.new
    files = optparser.parse!
    if files.count != 2 || !File.exist?(current_path + files[0])
      pp current_path + files[0]
      exit(-1)
    end
    files
  end
end
