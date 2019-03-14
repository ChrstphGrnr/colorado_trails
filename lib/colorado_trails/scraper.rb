# require 'pry'
# require 'nokogiri'
# require 'open-uri'
class ColoradoTrails::Scraper
    attr_accessor
    

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
            new_trail = ColoradoTrails::Trails.new 
            trail_info.each do |key, value|
                new_trail.send("#{key}=", value)
            end  
        end
        
       
        ColoradoTrails::Trails.all.each do |trail|
            puts trail.name + ', ' + trail.location
        end
        
    end

    def self.site(input)
        if input == :offroad 
            @site = "https://www.trails.com/toptrails.aspx?state=co&activity=od"
        elsif input == :hiking
            @site = "https://www.trails.com/toptrails.aspx?state=co&activity=hk"
        end 
    end

    def self.trail_details(trail)
        binding.pry
    end
    
    

end