class OffRoadTrails::Trails 

    attr_accessor :name, :location, :rating, :description, :type 
    @@all = []

    def initialize(name, location, description, rating, type)
        @name = name 
        @location = location
        @description = description
        @rating = rating 
        @type = type 
        @@all << self
    end



    def self.all 
        @@all
    end

end

