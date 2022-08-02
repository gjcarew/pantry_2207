require './lib/cook_book'
require './lib/ingredient'
require './lib/recipe'

RSpec.describe CookBook do
  context 'Iteration 2' do
    before :each do
      @ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      @recipe1 = Recipe.new("Mac and Cheese")
      @recipe1.add_ingredient(@ingredient1, 2)
      @recipe1.add_ingredient(@ingredient1, 4)
      @recipe1.add_ingredient(@ingredient2, 8)
      @recipe2 = Recipe.new("Cheese Burger")
      @cookbook = CookBook.new
    end

    it 'exists' do
      expect(@cookbook).to be_a CookBook
    end

    it 'has a list of recipes' do
      expect(@cookbook.recipes).to be_an Array
      expect(@cookbook.recipes).to be_empty
    end

    it 'can add recipes' do
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)

      expect(@cookbook.recipes).to eq([@recipe1, @recipe2])
    end
  end

  context 'Iteration  3' do
    before :each do
      ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      @recipe1 = Recipe.new("Mac and Cheese")
      @recipe1.add_ingredient(ingredient1, 2)
      @recipe1.add_ingredient(ingredient2, 8)
      ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})
      @recipe2 = Recipe.new("Cheese Burger")
      @recipe2.add_ingredient(ingredient1, 2)
      @recipe2.add_ingredient(ingredient3, 4)
      @recipe2.add_ingredient(ingredient4, 1)
      @cookbook = CookBook.new
      @cookbook.add_recipe(@recipe1)
      @cookbook.add_recipe(@recipe2)
    end

    it 'can list ingredients from all recipes' do
      expect(@cookbook.ingredients).to eq(["Cheese", "Macaroni", "Ground Beef", "Bun"])
    end

    it 'can tell the highest calorie meal' do
      expect(@cookbook.highest_calorie_meal).to eq(@recipe2)
    end
  end

  context 'Iteration 4' do
    before :each do
      @cookbook = CookBook.new
      ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
      ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
      recipe1 = Recipe.new("Mac and Cheese")
      recipe1.add_ingredient(ingredient1, 2)
      recipe1.add_ingredient(ingredient2, 8)
      ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
      ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 1})
      recipe2 = Recipe.new("Burger")
      recipe2.add_ingredient(ingredient3, 4)
      recipe2.add_ingredient(ingredient4, 100)
      @cookbook.add_recipe(recipe1)
      @cookbook.add_recipe(recipe2)
    end

    it "has a printed date" do
      allow(@cookbook).to receive(:date).and_return("04-22-2020")
      expect(@cookbook.date).to eq("04-22-2020")
    end

    it "has a summary" do
      expect(@cookbook.summary).to eq([{:name=>"Mac and Cheese", :details=>{:ingredients=>[{:ingredient=>"Macaroni", :amount=>"8 oz"}, {:ingredient=>"Cheese", :amount=>"2 C"}], :total_calories=>440}}, {:name=>"Burger", :details=>{:ingredients=>[{:ingredient=>"Ground Beef", :amount=>"4 oz"}, {:ingredient=>"Bun", :amount=>"100 g"}], :total_calories=>500}}])
    end
  end
end
