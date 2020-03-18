class Fleet
    def initialize
        @cars = []
    end

    def add(c)
        cars.append(c)
    end

    def cars
        @cars
    end

    def load_from_file(file_name)
        require 'json'
        json_data = File.read(file_name)
        ruby_objects = JSON.parse(json_data)
        for i in ruby_objects
            cars.append(Auto.new(i["mark"], i["model"], i["year"], i["consumption"]))
        end
    end

    def average_cons
        average = 0
        for i in cars
            average += i.gas_cons
        end
        if cars.count == 0
            return 0
        end
        average /= cars.count
    end

    def number_by_brand(brand)
        count = 0
        for i in cars
            if i.brand.eql?(brand)
                count +=1
            end
        end
        return count
    end

    def number_by_model(model)
        count = 0
        for i in cars
            if i.model == model
                count +=1
            end
        end
        return count
    end

    def consumption_by_brand(brand)
        count = 0
        average = 0
        for i in cars
            if i.brand == brand
                average += i.gas_cons
                count +=1
            end
        end
        if count == 0
            return 0
        end
        average /= count
    end
end