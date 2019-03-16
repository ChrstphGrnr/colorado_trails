

class ColoradoTrails::CLI

    attr_accessor :input, :user_name, :trails

    
    def initialize
        name 
        welcome 
        menu   
    end


    def name 
        a = Artii::Base.new 
        puts a.asciify('Colorado Trails!').colorize(:light_blue) 
        puts "\nWelcome to Colorado Trails!\n \nThis app can provide you with detailed info on the Top 20 trails in a variety of categories.".colorize(:light_blue)
        puts "Before we begin, would you mind telling me your name?\n".colorize(:light_blue)
        @user_name = gets.chomp
    end

    def welcome 
        puts "\nHello #{@user_name}, welcome! Are you ready to explore the trails?".colorize(:light_blue)
    end

    def menu 
        sleep(0.5)
        puts "\nPlease chose from the following trail options:\n".colorize(:light_blue)
        puts "-> Press [1] for the ".colorize(:light_blue)+"Top 20 hiking trails".colorize(:light_green)+" in Colorado.".colorize(:light_blue)
        puts "-> Press [2] for the ".colorize(:light_blue)+"Top 20 offroad trails".colorize(:light_green)+" in Colorado.".colorize(:light_blue)
        puts "-> Press [3] for the ".colorize(:light_blue)+"Top 20 mountain-biking trails".colorize(:light_green)+" in Colorado.".colorize(:light_blue)
        puts "\n-> Type 'exit' to end this program.\n".colorize(:light_red)
        
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
            puts "Not a valid input!".colorize(:light_red)
            menu
        end
        
    end

    def trail_list(input)
        ColoradoTrails::Scraper.trail_list(input)
    end
    
    def menu_2 

        puts "\nPlease chose from the following options:".colorize(:light_blue)
        puts "\n-> Select a specific trail by it's number.".colorize(:light_blue) 
        puts "-> Type 'menu' to return to the previous menu.".colorize(:light_blue)
        puts "\n-> Type 'exit' to end this program.\n".colorize(:light_red)

        input = gets.chomp.downcase
        
        input.include?("#") ? input.delete!("#") : input
        if input.to_i.between?(1, ColoradoTrails::Trails.all.length)
            trail = ColoradoTrails::Trails.all[input.to_i - 1]
            ColoradoTrails::Scraper.trail_details(trail)
            trail.showcase_details
            self.menu_3(trail)
            
        elsif input == "menu" 
            self.menu
        elsif input == "exit" || input == "quit"
            self.over_and_out
        else 
            puts "\nI don't understand your choice, please try again.".colorize(:light_red)
            self.menu_2
        end 
 
    end

    def menu_3(trail)
        puts "\nThe following options are available:\n".colorize(:light_blue)
        puts "-> Type 'menu' to return to the main menu for a choice of different types of trails.".colorize(:light_blue)
        puts "-> Type 'trail' to return to the trails menu for more trails like#{trail.name.delete("(/\#|[0-9]/)")}.".colorize(:light_blue)
        puts "\n-> Type 'exit' to end this program.\n\n".colorize(:light_red)

        new_input = gets.chomp.downcase
        case new_input 
        when 'menu'
            ColoradoTrails::Trails.clear
            self.menu
        when 'trail'
            ColoradoTrails::Trails.name_location
            self.menu_2
        when 'exit'
            self.over_and_out
        when 'quit'
            self.over_and_out
        end
    end

    def over_and_out
        puts "\nGoodbye ".colorize(:light_red)+"#{@user_name}".colorize(:white)+", thanks for exploring with us!\n".colorize(:light_red)
        puts "Come back soon to your...".colorize(:light_red)
        a = Artii::Base.new 
        puts a.asciify('Colorado Trails!').colorize(:light_blue)  
    end

end

    

