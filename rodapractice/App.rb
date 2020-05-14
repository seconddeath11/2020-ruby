# ddddd

# frozen_string_literal: true

require 'roda'

class App < Roda
  route do |r|
    r.root do
      'It is working!'
    end

    r.on 'hello' do
      @greeting = 'Hello with rerun???'
    end

    r.on 'get' do
      r.on 'rng' do
         "#{rand(100..5000)}"
      end

      r.on 'sophisticated' do
        r.on 'rng' do
        min = r.params['min']
        max = r.params['max']
        rand(min.to_i..max.to_i).to_s
       end
      end
    end

    r.on 'cool' do
      r.on 'hello', String, String do |name, sname|
         "hello, #{name} #{sname}"
      end
    end

    r.on 'calc' do
      r.on 'min', Integer, Integer do |num1, num2|
         [num1, num2].min.to_s
      end
    end


  end
end
