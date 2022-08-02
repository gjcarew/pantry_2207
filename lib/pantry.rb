class Pantry
  attr_reader :stock

  def initialize()
    @stock = Hash.new(0)
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, quantity)
    @stock[ingredient] += quantity
  end

  def enough_ingredients_for?(recipe)
    enough = recipe.ingredients_required.map do |ingredient, amount|
      @stock[ingredient] >= amount
    end

    enough.all?(true)
  end
end
