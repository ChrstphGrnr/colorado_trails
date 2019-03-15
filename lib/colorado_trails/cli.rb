

class ColoradoTrails::CLI

    attr_accessor :input, :user_name, :trails

    

    def initialize
        # name 
        # welcome 
        menu   
    end


    def name 
        puts "\nWelcome to Colorado Trails!\n \nThis app can provide you with detailed info on the Top 20 trails in a variety of categories."
        puts "Before we begin, would you mind telling me your name?\n\n"
        @user_name = gets.chomp
    end

    def welcome 
        puts "\nHello #{@user_name}, welcome! Are you ready to explore the trails?"
    end

    def menu 
        sleep(1)
        puts "\nPlease chose from the following trail options: 
              \nPress [1] for the Top 20 hiking trails in Colorado. 
              \nPress [2] for the Top 20 offroad trails in Colorado. 
              \nPress [3] for the Top 20 mountain-biking trails in Colorado.
              \n\nType 'exit' to end this program.\n\n"
        
        input = gets.chomp.downcase
        
        if input.length == 1 
            input = input.to_i\
        elsif input == "quit"
            input = "exit"
        end

        case input

        when 1
            puts "\n\n...loading hiking trails. This may take a moment.\n\n\n"
            trail_list(:hiking)
            ColoradoTrails::Trails.name_location
           
            menu_2

        when 2 
            puts "\n...loading offroad trails. This may take a moment.\n\n\n"
            trail_list(:offroad)
            ColoradoTrails::Trails.name_location
            
            menu_2

        when 3 
            puts "\n...loading mountain-biking trails. This may take a moment. \n\n\n"
            trail_list(:mountainbiking)
            ColoradoTrails::Trails.name_location

            menu_2

        when "menu"
            menu 
        when "exit"
            over_and_out
        else
            puts "Not a valid input!" 
            menu
        end
        
    end

    def trail_list(input)
        ColoradoTrails::Scraper.trail_list(input)
    end
    
    def menu_2 

        puts "\nPlease chose from the following options:"
        puts "\n-> Select a specific trail by it's number." 
        puts "-> Type 'menu' to return to the previous menu."
        puts "-> Type 'exit' to end this program.\n\n"

        input = gets.chomp.downcase
        # binding.pry
        input.include?("#") ? input.delete!("#") : input
        if input.to_i.between?(1, ColoradoTrails::Trails.all.length)
            trail = ColoradoTrails::Trails.all[input.to_i - 1]
            ColoradoTrails::Scraper.trail_details(trail)
        elsif input == "menu" 
            self.menu
        elsif input == "exit" || input == "quit"
            self.over_and_out
        else 
            puts "I don't understand your choice, please try again."
            menu_2
        end 
        
    end

    



    def over_and_out
        puts "\nGoodbye #{@user_name}, thanks for exploring with us!"
    end

end

    

