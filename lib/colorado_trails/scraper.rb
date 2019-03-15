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
        # binding.pryq
        # trails.css('span.sprite-trails.sprite-ic-star').each_with_index {|stars, i| ColoradoTrails::Trails.all[i].rating = stars.length}

        # binding.pry
    


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
        doc_value = Nokogiri::HTML(open(site)).css('div.info_Data').collect {|info| info.text}
        doc_key = Nokogiri::HTML(open(site)).css('div.info_label').collect {|info| info.text}
        binding.pry

        # rating scraper line:
        # rating = page.css("div.rating-section").children.css('img').attribute('alt').text
        # => "5 out of 5 stars"

        doc
        
    end
    
    

end