class Ingredient
  attr_reader :name, :unit, :calories

  def initialize(init_hash)
    @name = init_hash[:name]
    @unit = init_hash[:unit]
    @calories = init_hash[:calories]
  end
end
