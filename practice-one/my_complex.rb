class MyComplex
    def initialize(real, imaginary)
        @real = real
        @imaginary = imaginary
    end

    def to_s
        "#{@real} + i*#{@imaginary}"
    end

    def real
        @real 
    end

    def imaginary
        @imaginary
    end

    def real=(real)
        @real = real
    end

    def imaginary=(imaginary)
        @imaginary = imaginary
    end

    def add(c)
        MyComplex.new(real + c.real, imaginary + c.imaginary)
    end
end