# require 'pry'
# require 'nokogiri'
# require 'open-uri'
class OffRoadTrails::Scraper
    attr_accessor
    
    @@all_trails = []
    
    def self.all 
        @@all_trails
    end

    



    def self.trail_list(input)

        self.site(input)

        trails = []

        trail_list = Nokogiri::HTML(open(@site)).css('div.name').collect {|trail| trail.text}
        locations = Nokogiri::HTML(open(@site)).css('div.state').collect {|state| state.text.chomp(', CO')}
        url_list = Nokogiri::HTML(open(@site)).css("div.trail-info").collect {|trail| trail.css('div.img-wrapper a').attribute('href').value}
        
        trail_list.each_with_index do |trail, i| 
            trails << {:name => trail}
        end

        locations.each_with_index do |l, i|
            trails[i][:location] = l
        end

        url_list.each_with_index do |url, i|
            trails[i][:url] = url 
        end

        trails.each do |trail_info|
            new_trail = OffRoadTrails::Trails.new 
            trail_info.each do |key, value|
                new_trail.send("#{key}=", value)
            end  
        end
        
        puts "\nHere are the Top 20 #{input} trails in Colorado:\n\n"
        OffRoadTrails::Trails.all.each do |trail|
            puts trail.name + ', ' + trail.location
        end
        
        puts "\nIf you would like to find out more about a trail, enter it's number. Other options are 'menu' and 'exit'."
        
    end
    

end