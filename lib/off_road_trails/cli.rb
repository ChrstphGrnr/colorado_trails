

class OffRoadTrails::CLI

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
            OffRoadTrails::Scraper.trail_list(:hiking)
            menu_2

        when 2 
            OffRoadTrails::Scraper.trail_list(:offroad)
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

        # while input != "exit"

        #     input = gets.chomp.strip.downcase
            
        #     if input.to_i == 1 
        #         OffRoadTrails::Scraper.trail_list(:hiking)
        #         input = gets.chomp.strip.downcase
                    


        #     elsif input.to_i == 2 
        #         OffRoadTrails::Scraper.trail_list(:offroad)
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
        


    

    def over_and_out
        puts "\nGood Bye #{@user_name}, thanks for exploring."
    end

    def menu_2 
        puts "Please chose from the following options:"
        puts "Select a specific trail by it's number"
        input = gets.chomp.downcase
        input.include?("#") ? input.delete("#").to_i : input = input.to_i
        puts input
        binding.pry
    end




end

    

