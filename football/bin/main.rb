# frozen_string_literal: true

require_relative 'C:\Users\novik\.vscode\2020-ruby\football\lib\matches.rb'
def main
  matches = Matches.new
  matches.read('data/data.csv')
  matches.iterator_by_names do |match|
    puts match
  end
end

def create_table; end
main if __FILE__ == $PROGRAM_NAME
