# frozen_string_literal: true

require 'csv'
require_relative 'C:\Users\novik\.vscode\2020-ruby\football\lib\result.rb'
class Matches
  def initialize(results = [])
    @results = results
  end

  def iterator_by_names
    names = []
    @results.each do |result|
      names.push(result.name1) unless names.include?(result.name1)
      names.push(result.name2) unless names.include?(result.name2)
    end
    names.sort.to_enum
  end

  def read(path)
    csv = CSV.read(path)
    csv.each do |row|
      result = Result.new(row[0], row[1], row[2].to_i, row[3].to_i)
      @results.append(result)
    end
  end
end
