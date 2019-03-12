# require 'pry'
# require 'nokogiri'
# require 'open-uri'
class OffRoadTrails::Scraper
    attr_accessor :site, :site_data, :trail_list

    # def initialize
    #     @site = nil
    #     @off_road = nil 
    #     @hiking = nil 
    #     @trail_list = nil
        
    # end

    def trail_list(input)
        if input == :offroad
            @site = "https://www.trails.com/toptrails.aspx?state=co&activity=od"          
        elsif input == :hiking
            @site = "https://www.trails.com/toptrails.aspx?state=co&activity=hk"
        end

        # binding.pry
        @site_data = Nokogiri::HTML(open(@site))
        # binding.pry
        @trail_list = @site_data.css('div.name').collect {|trail| trail.text}
        @locations = Nokogiri::HTML(open(@site)).css('div.state').collect {|state| state.text.chomp(', CO')}
        @locations.each_with_index { |v, i| @trail_list[i] = @trail_list[i] + ', ' + v }
        binding.pry
          
        puts @trail_list 
        puts "\nIf you would like to find out more about a trail, enter it's number. Other options are 'menu' and 'exit'."
        # binding.pry
    end

    # def trail_details()

end