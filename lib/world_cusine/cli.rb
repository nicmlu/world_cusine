class World_Cusine::CLI

    def call 
    greeting
    area_meals 
    meal_info
    recipe_box
    another_search
    goodbye
    end 

    def greeting
        puts " ==================================================================== "
        puts " ==================================================================== "
        puts " ==================================================================== "
        puts " ==================================================================== "
        puts " ==================================================================== "
        puts "  _    _               _      _   _____              _                "             
        puts " | |  | |             | |    | | /  __ \            (_)               "             
        puts " | |  | |  ___   _ __ | |  __| | | /  \/ _   _  ___  _  _ __    ___   " 
        puts " | |/\| | / _ \ | '__|| | / _` | | |    | | | |/ __|| || '_ \  / _ \  "
        puts " \  /\  /| (_) || |   | || (_| | | \__/\| |_| |\__ \| || | | ||  __/  "
        puts "  \/  \/  \___/ |_|   |_| \__,_|  \____/ \__,_||___/|_||_| |_| \___|  "
        puts " ==================================================================== "
        puts " ==================================================================== "
        puts " ==================================================================== "
        puts " ==================================================================== "
        puts " ==================================================================== "
        sleep 2
        puts ""
        puts "Welcome to World Cusine!"
        puts ""
        puts "What is your name?"
        puts ""
        name = gets.strip.capitalize
        puts ""
        puts "Hi #{name}! World Cusine makes it easy for you to find tasty recipes from all over the world!"
        puts ""
        sleep 4
        puts "Here is the list of cusine areas you can explore:"
        sleep 4
        puts ""
        list_areas
    end

    def list_areas 
        World_Cusine::API.all_areas
        World_Cusine::Area.all.each.with_index {|a, i| puts "#{i + 1}. #{a.strArea}"}
    end    
    
    def area_meals
        puts ""
        puts "========================================================================================================="
        puts "To see a list of meals from an area, type in the number of that area or type in exit to end the search..."
        puts ""
        input = gets.chomp.downcase  
        if input == "exit"
        goodbye
        elsif (1..World_Cusine::Area.all.size).include?(input.to_i)
            puts ""
            puts "What a great area to explore! Let's see what meals you can cook up..."
            puts ""
            sleep 2
            area = World_Cusine::Area.all[input.to_i - 1]
            
            puts "Here are the cusine options..."
            puts ""
            puts ""
            sleep 2 
            World_Cusine::API.get_area_meals(area)
            World_Cusine::Meal.all.each.with_index {|m, i| puts "#{i + 1}. #{m.strMeal}"}
        else 
            puts "Sorry, but that is not a valid option. Please type in a different area number..."
            area_meals
        end
    end 

    def meal_info 
        
        puts ""
        puts ""
        puts "To see more information about a meal, type in the number of that meal or type in exit to end the search..."
        puts ""
        
        input = gets.chomp 
        if input == "exit"
        goodbye
        elsif (1..World_Cusine::Meal.all.size).include?(input.to_i)

        puts ""
        puts "Here is the meal you selected:"
        puts "=============================================================="
    
        selected_meal = World_Cusine::Meal.all[input.to_i - 1]
        # binding.pry
        selected_meal_id_str = selected_meal.idMeal
        selected_meal_id_int = selected_meal_id_str.to_i
        # meal_id = selected_meal_id.to_i
        selected_meal_hash = World_Cusine::API.get_meal_info(selected_meal_id_int)
        selected_meal_info = selected_meal_hash["meals"]
        # binding.pry
        

        puts "Meal Name: #{selected_meal_info[0]["strMeal"]}"
        puts "Meal Category: #{selected_meal_info[0]["strCategory"]}"
        puts "Meal Area: #{selected_meal_info[0]["strArea"]}"
        puts ""
        puts ""

        puts "=============================================================="
        puts "Meal Ingredients: "
        puts "#{selected_meal_info[0]["strIngredient1"]}: #{selected_meal_info[0]["strMeasure1"]}" unless selected_meal_info[0]["strIngredient1"] == "null" || selected_meal_info[0]["strIngredient1"] == ""
        puts "#{selected_meal_info[0]["strIngredient2"]}: #{selected_meal_info[0]["strMeasure2"]}" unless selected_meal_info[0]["strIngredient2"] == "null" || selected_meal_info[0]["strIngredient2"] == ""
        puts "#{selected_meal_info[0]["strIngredient3"]}: #{selected_meal_info[0]["strMeasure3"]}" unless selected_meal_info[0]["strIngredient3"] == "null" || selected_meal_info[0]["strIngredient3"] == ""
        puts "#{selected_meal_info[0]["strIngredient4"]}: #{selected_meal_info[0]["strMeasure4"]}" unless selected_meal_info[0]["strIngredient4"] == "null" || selected_meal_info[0]["strIngredient4"] == ""
        puts "#{selected_meal_info[0]["strIngredient5"]}: #{selected_meal_info[0]["strMeasure5"]}" unless selected_meal_info[0]["strIngredient5"] == "null" || selected_meal_info[0]["strIngredient5"] == ""
        puts "#{selected_meal_info[0]["strIngredient6"]}: #{selected_meal_info[0]["strMeasure6"]}" unless selected_meal_info[0]["strIngredient6"] == "null" || selected_meal_info[0]["strIngredient6"] == ""
        puts "#{selected_meal_info[0]["strIngredient7"]}: #{selected_meal_info[0]["strMeasure7"]}" unless selected_meal_info[0]["strIngredient7"] == "null" || selected_meal_info[0]["strIngredient7"] == ""
        puts "#{selected_meal_info[0]["strIngredient8"]}: #{selected_meal_info[0]["strMeasure8"]}" unless selected_meal_info[0]["strIngredient8"] == "null" || selected_meal_info[0]["strIngredient8"] == ""
        puts "#{selected_meal_info[0]["strIngredient9"]}: #{selected_meal_info[0]["strMeasure9"]}" unless selected_meal_info[0]["strIngredient9"] == "null" || selected_meal_info[0]["strIngredient9"] == ""
        puts "#{selected_meal_info[0]["strIngredient10"]}: #{selected_meal_info[0]["strMeasure10"]}" unless selected_meal_info[0]["strIngredient10"] == "null" || selected_meal_info[0]["strIngredient10"] == ""
        puts "#{selected_meal_info[0]["strIngredient11"]}: #{selected_meal_info[0]["strMeasure11"]}" unless selected_meal_info[0]["strIngredient11"] == "null" || selected_meal_info[0]["strIngredient11"] == ""
        puts "#{selected_meal_info[0]["strIngredient12"]}: #{selected_meal_info[0]["strMeasure12"]}" unless selected_meal_info[0]["strIngredient12"] == "null" || selected_meal_info[0]["strIngredient12"] == ""
        puts "#{selected_meal_info[0]["strIngredient13"]}: #{selected_meal_info[0]["strMeasure13"]}" unless selected_meal_info[0]["strIngredient13"] == "null" || selected_meal_info[0]["strIngredient13"] == ""
        puts "#{selected_meal_info[0]["strIngredient14"]}: #{selected_meal_info[0]["strMeasure14"]}" unless selected_meal_info[0]["strIngredient14"] == "null" || selected_meal_info[0]["strIngredient14"] == ""
        puts "#{selected_meal_info[0]["strIngredient15"]}: #{selected_meal_info[0]["strMeasure15"]}" unless selected_meal_info[0]["strIngredient15"] == "null" || selected_meal_info[0]["strIngredient15"] == ""
        puts "#{selected_meal_info[0]["strIngredient16"]}: #{selected_meal_info[0]["strMeasure16"]}" unless selected_meal_info[0]["strIngredient16"] == "null" || selected_meal_info[0]["strIngredient16"] == ""
        puts "#{selected_meal_info[0]["strIngredient17"]}: #{selected_meal_info[0]["strMeasure17"]}" unless selected_meal_info[0]["strIngredient17"] == "null" || selected_meal_info[0]["strIngredient17"] == ""
        puts "#{selected_meal_info[0]["strIngredient18"]}: #{selected_meal_info[0]["strMeasure18"]}" unless selected_meal_info[0]["strIngredient18"] == "null" || selected_meal_info[0]["strIngredient18"] == ""
        puts "#{selected_meal_info[0]["strIngredient19"]}: #{selected_meal_info[0]["strMeasure19"]}" unless selected_meal_info[0]["strIngredient19"] == "null" || selected_meal_info[0]["strIngredient19"] == ""
        puts "#{selected_meal_info[0]["strIngredient20"]}: #{selected_meal_info[0]["strMeasure20"]}" unless selected_meal_info[0]["strIngredient20"] == "null" || selected_meal_info[0]["strIngredient20"] == ""
        puts ""
        puts ""    
        puts "=============================================================="
        puts "Meal Instructions: #{selected_meal_info[0]["strInstructions"]}"

        else 
            puts "Sorry that is not a valid option, please try a different number"
            list_meals
        end
    end 

    def recipe_box
        puts ""
        puts "=============================================================="
        puts "Would you like to save this meal to your recipe box?"
        puts ""
        puts "Enter 'yes' to save..."
        puts ""
        puts "Enter 'no' to start another search..."
        puts ""
        puts "Enter 'exit' to end the search..."
        puts ""
        input = gets.chomp.downcase 
        if input == "exit"
            goodbye
        end
        puts ""
        case input
            when "yes"
            World_Cusine::Meal.recipe_box
            puts "Your recipe has been saved!"
            exit
            
            when "no"
            exit
            
            else
            puts "I don't understand that answer."
            recipe_box
        end

    end 

    def another_search
        puts ""
        puts ""
        puts "=============================================================="
        puts "Enter 'yes' to search for another meal..."
        puts ""
        puts "Enter 'area' to search for another area..."
        puts ""
        puts "Enter 'exit' to end the search..."
        puts ""
           input = gets.chomp.downcase 
        if input == "exit"
            goodbye
        end
        puts ""
        case input
            when "yes"
            area_meals
            when "area"
            list_areas
        else
            puts "I don't understand that answer."
            another_search
        end
    end 
        

    def goodbye
        puts "Hope you we're able to explore some delicous destinations! Thank you for using World Cusine!"
        exit
    end 
end