class ColoradoTrails::Trails 

    attr_accessor   :name, :location, :rating, :description, :type, :url, 
                    :difficulty, :distance, :duration
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

    def showcase_details
        binding.pry
        trail_name = self.name.delete("(/\#|[0-9]/)").strip
        puts "Here are the details for #{trail_name}:"
        puts "Location:     #{self.location}, CO"
        puts "Rating:       #{self.rating}"
        puts "Trail Type:   #{self.type}"
        puts "Distance      #{self.distance}"
        puts "Duration      #{self.duration}"
        puts "Difficulty    #{self.difficulty}"
        puts "Website       #{self.url}"
        
    end

end

