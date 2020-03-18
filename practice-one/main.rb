require_relative 'my_complex.rb'

def main
    complex1 = MyComplex.new(1, 1)
    complex2 = MyComplex.new(2, 4)
    puts complex1, complex2
    puts "Сумма: #{complex1.add(complex2)}"
end 

if __FILE__ == $0
    main
end