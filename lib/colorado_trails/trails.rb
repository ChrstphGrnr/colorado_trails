class ColoradoTrails::Trails 

    attr_accessor   :name, :location, :rating, :description, :type, :url, 
                    :difficulty, :distance, :nearby_city, :duration
    @@all = []

    def initialize(name= nil, location= nil, rating= nil, url= nil)
        @name = name
        @@all << self
    end


    def self.all 
        @@all
    end

    def self.clear
        @@all.clear
    end

    def self.name_location 
        puts "Showing Trail,  Location\n\n"
        @@all.each do |trail|
            puts trail.name + ",    " + trail.location
        end
    end


end

