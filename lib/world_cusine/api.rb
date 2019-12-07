class World_Cusine::API
  attr_accessor :strArea, :idMeal

  def self.all_areas
    area_response = HTTParty.get('https://www.themealdb.com/api/json/v1/1/list.php?a=list')
    area_response["meals"].each {|area_hash| World_Cusine::Area.new(area_hash)}
  end

  def self.get_area_meals(area_instance)
    meals_response = HTTParty.get("https://www.themealdb.com/api/json/v1/1/filter.php?a=#{area_instance.strArea}")
    meals_response["meals"].each {|meal_hash| World_Cusine::Meal.new(meal_hash)}
  end

  def self.get_meal_info(meal_instance)
    
    meal_info_response = HTTParty.get("https://www.themealdb.com/api/json/v1/1/lookup.php?i=#{meal_instance}")
    # binding.pry
    meal_info_response
  end 
end