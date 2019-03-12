

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
        puts "\nHello #{@user_name}, ready to explore?"
    end

    def menu 
        sleep(1)
        puts "\nPlease chose from the following options: \nPress [1] for the Top 20 hiking trails in Colorado. \nPress [2] for the Top 20 Off-Roading trails in Colorado. \n\nType 'exit' to quit this program."
        
        input = nil

        while input != "exit"

            input = gets.chomp.strip.downcase
            
            if input.to_i == 1 
                puts "This is the current Top 20 of hiking trails in Colorado:\n\n"
                OffRoadTrails::Scraper.new.trail_list(:hiking)
                
            elsif input.to_i == 2 
                puts "This is the current Top 20 of off-roading trails in Colorado:\n\n"
                OffRoadTrails::Scraper.new.trail_list(:offroad)
                
            elsif input == "menu"
                puts "\nPlease chose from the following options: \nPress [1] for the Top 20 hiking trails in Colorado. \nPress [2] for the Top 20 Off-Roading trails in Colorado. \n\nType 'exit' to quit this program."
        
            elsif input == "exit"
                over_and_out
            else
                puts "Not a valid input!" 
                puts "Please chose from the following options: \nPress [1] for the Top 20 hiking trails in Colorado. \nPress [2] for the Top 20 Off-Roading trails in Colorado. \nType 'exit' to quit this program."

            end
        end
        


    end

    def over_and_out
        puts "\nGood Bye #{@user_name}, thanks for exploring."
    end

end

    

