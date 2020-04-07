# My comment
# frozen_string_literal: true

require_relative 'auto.rb'
require_relative 'fleet.rb'

def main
  fleet = Fleet.new
  fleet.load_from_file('practice-two\car-list.json')
  auto1 = Auto.new("\xD0\x93\xD0\xB0\xD0\xB7", '2107', 1995, 10)
  fleet.add(auto1)
  puts fleet.average_cons
  puts fleet.number_by_brand('Honda')
  puts fleet.number_by_model('Civic 1,8i')
  puts fleet.consumption_by_brand('Honda')
  puts fleet.number_by_brand("\xD0\x93\xD0\xB0\xD0\xB7")
end

main if __FILE__ == $PROGRAM_NAME
