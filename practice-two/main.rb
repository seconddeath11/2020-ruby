require_relative 'auto.rb'
require_relative 'fleet.rb'

def main
    fleet = Fleet.new
    fleet.load_from_file('practice-two\car-list.json')
    auto1 = Auto.new("Газ", "2107", 1995, 10)
    fleet.add(auto1)
    puts fleet.average_cons
    puts fleet.number_by_brand("Honda")
    puts fleet.number_by_model("Civic 1,8i")
    puts fleet.consumption_by_brand("Honda")
    puts fleet.number_by_brand("Газ")
end


if __FILE__ == $0
    main
end