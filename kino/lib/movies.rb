require 'csv'
require_relative 'C:\Users\novik\.vscode\2020-ruby\kino\lib\movie.rb'
class Movies
    def initialize
        @movies = []
    end

    def read_data(filepath)
        csv = CSV.read(filepath, headers: true)
        csv.each do |row|
            movie = Movie.new(row["title"], row["kinopoisk"], row["imdb"], row["metacritic"], row["rotten_tomatoes"])
            @movies.append(movie)
        end
    end

    #def sort
     #   @movies.sort_by(&:new_rating)
    #end

    def save_sorted(filepath)
        CSV.open(filepath, "wb") do |csv|
            @movies.each do |movie|
                csv << movie.to_s
            end
        end
    end
end