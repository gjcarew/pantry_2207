require './lib/pantry'

RSpec.describe Pantry do
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
