# frozen_string_literal: true

require 'csv'
require 'tty-prompt'
require_relative'C:\Users\novik\.vscode\2020-ruby\lab1\lib\trains.rb'
require_relative'C:\Users\novik\.vscode\2020-ruby\lab1\lib\train.rb'
require_relative'C:\Users\novik\.vscode\2020-ruby\lab1\lib\Stop.rb'
def main
  csv2 = CSV.read('C:\Users\novik\.vscode\2020-ruby\lab1\data\stations.csv', headers:true, encoding: "utf-8")
  stations = {}
  csv2.each do |row|
    stations[row['CODE']] = row['TITLE'].strip
  end
  csv = CSV.read('C:\Users\novik\.vscode\2020-ruby\lab1\data\stops.csv', headers: true, encoding: "utf-8")
  trains = Trains.new()
  a = 0
  last_train = Train.new(-1)
  csv.each do |row|
    if row['TRAINID'].to_i != last_train.number
      last_train = Train.new(row['TRAINID'].to_i)
      trains.add(last_train)
    end
    last_train.add_stop(Stop.new(
                          row['NUMBER'], stations[row['STATION_CODE']], row['ARRIVAL_TIME'],
                          row['STOP_DURATION'], row['DISTANCE']
                        ))
  end

  choices = { "\xD0\xA0\xD0\xB0\xD1\x81\xD0\xBF\xD0\xB8\xD1\x81\xD0\xB0\xD0\xBD\xD0\xB8\xD0\xB5" => 1, "\xD0\xA1\xD0\xBF\xD0\xB8\xD1\x81\xD0\xBE\xD0\xBA" => 2, "\xD0\x9A\xD0\xBE\xD0\xBD\xD0\xB5\xD1\x86" => 3 }
  prompt = read_in
    
  switch_choices(prompt.select('Выберите действие', choices), trains, prompt)
end

def read_in
  prompt = TTY::Prompt.new
end


def switch_choices(num, trains, prompt)
  if num == 1
    train = prompt.select('Выберите поезд') do |menu|
      trains.each_train do |train_choice|
        menu.choice(train_choice.to_s, train_choice)
      end
    end
    train.show_stops
  end

  if num == 2
    trains.each_train_by_length do |train|
      puts "#{train.stop_count} #{train.to_s}" 
    end
  end
  return if num == 3
end

main if __FILE__ == $PROGRAM_NAME
