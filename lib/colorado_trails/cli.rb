

class ColoradoTrails::CLI

    attr_accessor :input, :user_name, :trails

    

    def initialize
        name 
        welcome 
        menu   
    end


    def name 
        puts "Before we begin, would you mind telling me your name?"
        @user_name = gets.chomp
    end

    def welcome 
        puts "\nHello #{@user_name}, welcome! Are you ready to explore the trails?"
    end

    def menu 
        sleep(1)
        puts "\nPlease chose from the following options: \nPress [1] for the Top 20 hiking trails in Colorado. \nPress [2] for the Top 20 offroad trails in Colorado. \n\nType 'exit' to quit this program."
        
        input = gets.chomp.downcase
        
        input == "1" || input == "2" ? input = input.to_i : input

        case input

        when 1
            puts "\n\n...loading hiking trails. This may take a moment.\n\n\n"
            trail_list(:hiking)
            # ColoradoTrails::Scraper.trail_list(:hiking)
            menu_2

        when 2 
            puts "...loading hiking trails. This may take a moment.\n\n\n"
            trail_list(:offroad)
            # ColoradoTrails::Scraper.trail_list(:offroad)
            menu_2
        when "menu"
            menu 
        when "exit" || "quit"
            over_and_out
        else
            puts "Not a valid input!" 
            menu
        end
        
    end

    def trail_list(input)
        ColoradoTrails::Scraper.trail_list(input)
    end


        # while input != "exit"

        #     input = gets.chomp.strip.downcase
            
        #     if input.to_i == 1 
        #         ColoradoTrails::Scraper.trail_list(:hiking)
        #         input = gets.chomp.strip.downcase
                    


        #     elsif input.to_i == 2 
        #         ColoradoTrails::Scraper.trail_list(:offroad)
        #         input = gets.chomp.strip.downcase

        #     elsif input == "menu"
        #         puts "\nPlease chose from the following options: \nPress [1] for the Top 20 hiking trails in Colorado. \nPress [2] for the Top 20 Off-Roading trails in Colorado. \n\nType 'exit' to quit this program."
        
        #     elsif input == "exit"
        #         over_and_out
        #     else
        #         puts "Not a valid input!" 
        #         puts "Please chose from the following options: \nPress [1] for the Top 20 hiking trails in Colorado. \nPress [2] for the Top 20 Off-Roading trails in Colorado. \nType 'exit' to quit this program."

        #     end
        # end
        


    

    

    def menu_2 

        puts "\nSelect a specific trail by it's number, type 'menu' to return to the previous menu or type 'exit' to end this program."
        input = gets.chomp.downcase
        # binding.pry
        input.include?("#") ? input.delete!("#") : input
        if input.to_i.between?(1, ColoradoTrails::Trails.all.length)
            trail = ColoradoTrails::Trails.all[input.to_i - 1]
            ColoradoTrails::Scraper.trail_details(trail)
        elsif input == "menu"
            self.menu
        elsif input == "exit"
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

    

