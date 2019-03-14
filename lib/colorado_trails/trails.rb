class ColoradoTrails::Trails 

    attr_accessor :name, :location, :rating, :description, :type, :url, :difficulty, :duration, :nearby_city, :vehicles, :season
    @@all = []

    def initialize
        @@all << self
    end


    def self.all 
        @@all
    end

end

