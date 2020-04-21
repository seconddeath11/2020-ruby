# frozen_string_literal: true

require_relative 'train.rb'

# jgbcft

class Trains
  def initialize(trains = [])
    @trains = trains
  end

  def add(new_one)
    @trains.append(new_one)
  end

  def each_train
    @trains.each do |train|
      yield train
    end
  end

  def each_train_by_length
    @trains.sort_by(&:stop_count).each do |train|
      yield train
    end
  end
end
