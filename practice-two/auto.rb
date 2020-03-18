class Auto
    def initialize(brand, model, year, gas_cons)
        @brand = brand
        @model = model
        @year = year
        @gas_cons = gas_cons
    end

    def brand
        @brand
    end

    def model 
        @model
    end

    def year
        @year
    end

    def gas_cons
        @gas_cons
    end

    def to_s
        "#{brand} #{model} #{year} #{gas_cons}"
    end


end