# require 'pry'
# require 'nokogiri'
# require 'open-uri'
class ColoradoTrails::Scraper
    attr_accessor
    

    def self.trail_list(input)

        ColoradoTrails::Trails.clear

        self.site(input)

        
        # 2nd edition working code

        ### refactor to do it all in one .each ? 
    
        trails = Nokogiri::HTML(open(@site)).css('div.trails-listing')

        trails.css('div.trail-info div.name').each {|trail| ColoradoTrails::Trails.new(trail.text)}
    
        trails.css('div.state').each_with_index {|location, i| ColoradoTrails::Trails.all[i].location = location.text.chomp(', CO')}
        
        trails.css('div.img-wrapper a').each_with_index {|url, i| ColoradoTrails::Trails.all[i].url = "https://www.trails.com" + url.attribute('href').value}
       
        # original working code  

        # trails = []

        # trail_list = Nokogiri::HTML(open(@site)).css('div.name').collect {|trail| trail.text}
        # locations = Nokogiri::HTML(open(@site)).css('div.state').collect {|state| state.text.chomp(', CO')}
        # url_list = Nokogiri::HTML(open(@site)).css("div.trail-info").collect {|trail| trail.css('div.img-wrapper a').attribute('href').value}
        
        # trail_list.each_with_index do |trail, i| 
        #     trails << {:name => trail}
        # end

        # locations.each_with_index do |l, i|
        #     trails[i][:location] = l
        # end

        # url_list.each_with_index do |url, i|
        #     trails[i][:url] = "https://www.trails.com" + url 
        # end

        # trails.each do |trail_info|
        #     new_trail = ColoradoTrails::Trails.new 
        #     trail_info.each do |key, value|
        #         new_trail.send("#{key}=", value)
        #     end  
        # end
        
        # ColoradoTrails::Trails.all.each do |trail|
        #     puts trail.name + ', ' + trail.location
        # end
        
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
        # binding.pry
        site = trail.url    
        # binding.pry
        doc = Nokogiri::HTML(open(site)).css('div.Wrapper')

        
        info = doc.css('div.info_Data').collect {|label| label.text.strip}
        labels = doc.css('div.info_label').collect {|info| info.text.strip}
        
        # binding.pry

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
        trail.description = doc.css('p.summary').text.delete'(/["]/)'
        # binding.pry
    
    end

end