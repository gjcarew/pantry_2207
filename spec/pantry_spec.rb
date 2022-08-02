require './lib/pantry'

RSpec.describe Pantry do
  context 'Iteration 1' do
    before :each do
      @pantry = Pantry.new
      @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
    end

    it 'has stock' do
      expect(@pantry.stock).to be_a Hash
      expect(@pantry.stock).to be_empty
    end

    it 'can check stock of an ingredient' do
      expect(@pantry.stock_check(@ingredient1)).to eq(0)
    end

    it 'can restock ingredients' do
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)
      expect(@pantry.stock_check(@ingredient1)).to eq(15)
    end
  end

  context 'Iteration 3' do
    before :each do
      @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      @recipe1 = Recipe.new("Mac and Cheese")
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient2, 8)
      @ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      @ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
      @recipe2 = Recipe.new("Cheese Burger")
      @recipe2.add_ingredient(@ingredient1, 2)
      @recipe2.add_ingredient(@ingredient3, 4)
      @recipe2.add_ingredient(@ingredient4, 1)
      @pantry = Pantry.new
      @pantry.restock(@ingredient1, 5)
      @pantry.restock(@ingredient1, 10)
    end

    it 'can tell if there are enough ingredients for a recipe' do
      expect(@pantry.enough_ingredients_for?(@recipe1)).to be false
      @pantry.restock(@ingredient2, 7)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to be false
      @pantry.restock(@ingredient2, 1)
      expect(@pantry.enough_ingredients_for?(@recipe1)).to be true
    end

  end
end
