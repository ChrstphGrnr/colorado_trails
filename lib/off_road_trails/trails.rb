class OffRoadTrails::Trails 

    attr_accessor :name, :location, :rating, :description, :type, :url
    @@all = []

    def initialize
        @@all << self
    end


    def self.all 
        @@all
    end

end

