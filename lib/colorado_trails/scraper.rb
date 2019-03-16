# require 'pry'
# require 'nokogiri'
# require 'open-uri'
class ColoradoTrails::Scraper
    attr_accessor
    

    def self.trail_list(input)

        ColoradoTrails::Trails.clear

        self.site(input)

        ### refactor to do it all in one .each ? 
    
        trails = Nokogiri::HTML(open(@site)).css('div.trails-listing')

        trails.css('div.trail-info div.name').each {|trail| ColoradoTrails::Trails.new(trail.text)}
    
        trails.css('div.state').each_with_index {|location, i| ColoradoTrails::Trails.all[i].location = location.text.chomp(', CO')}
        
        trails.css('div.img-wrapper a').each_with_index {|url, i| ColoradoTrails::Trails.all[i].url = "https://www.trails.com" + url.attribute('href').value}
        
    end

    def self.site(input)
        if input == :offroad 
            @site = "https://www.trails.com/toptrails.aspx?state=co&activity=od"
        elsif input == :hiking
            @site = "https://www.trails.com/toptrails.aspx?state=co&activity=hk"
        elsif input == :mountainbiking
            @site = "https://www.trails.com/toptrails.aspx?state=co&activity=mb"
        end 

    end

    def self.trail_details(trail)
        
        site = trail.url    
        
        doc = Nokogiri::HTML(open(site)).css('div.Wrapper')

        
        info = doc.css('div.info_Data').collect {|label| label.text.strip}
        labels = doc.css('div.info_label').collect {|info| info.text.strip}
        
        

        labels.each_with_index do |label, i|

            case label.downcase.strip
            when "trail type"
                trail.type = info[i].strip
            when "difficulty"
                trail.difficulty = info[i].strip
            when "skill level"
                trail.difficulty = info[i].strip
            when "duration"
                trail.duration = info[i].strip
            when "distance"
                trail.distance = info[i].strip + " miles"
            end         

        end

        trail.rating = "#{doc.css('div.rating-section').children.css('img').attribute('alt').text[0]}/5 stars"
        trail.description = nil 
        binding.pry
        if !doc.css('p.summary').empty?
            trail.description = doc.css('p.summary').text.delete'(/["]/)' 
        else   
            trail.description = doc.css('div#TrailDetailsDescription')           
        end
            # if doc.css('p.summary').text.delete'(/["]/)'  
        
    
    end

end