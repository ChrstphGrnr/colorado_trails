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
        puts "Trail".ljust(70) + "Location\n\n"
        @@all.each do |trail|
            puts trail.name.ljust(70) + trail.location
        end
    end




    def showcase_details
        
        trail_name = self.name.delete("(/\#|[0-9]/)").strip
        
        puts "\n\nHere are the details for #{trail_name}:\n\n"
        puts "Rating:       #{self.rating}" unless self.rating == nil || self.rating.empty?
        puts "Trail Type:   #{self.type}"   unless self.type == nil || self.type.empty?
        puts "Distance      #{self.distance}"   unless self.distance == nil || self.distance.empty?
        puts "Duration      #{self.duration}"   unless self.duration == nil || self.duration.empty?
        puts "Difficulty    #{self.difficulty}" unless self.difficulty == nil || self.duration.empty?
        puts "Website       #{self.url}"
        
        if self.description != nil || self.description != ""
            # binding.pry
            self.description = self.description + " "
            puts "\n\nHere is a short description of the trail:\n\n#{self.description.scan(/.{1,66} /).join("\n")}"
        end
    
    end

end

