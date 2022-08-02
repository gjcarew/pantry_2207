require 'date'

class CookBook
  attr_reader :recipes

  def initialize
    @recipes = []
  end

  def add_recipe(recipe)
    @recipes << recipe
  end

  def ingredients
    ingredients = @recipes.flat_map{|recipe| recipe.ingredients}
    ingredients.map{|ingredient| ingredient.name}.uniq
  end

  def highest_calorie_meal
    @recipes.max_by{|recipe| recipe.total_calories}
  end

  def date
    Date.today.strftime("%D")
  end

  def summary
    summary_arr = []
    @recipes.map do |recipe|
      summary_h = Hash.new
      summary_h[:name] = recipe.name
      summary_h[:details] = recipe.ingredients_required
      summary_h[:total_calories] = recipe.total_calories
      summary_arr << summary_h
    end
    summary_arr
  end

end
