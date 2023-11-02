require 'rails_helper'

RSpec.describe 'the dish show page' do
  before :each do
    @shawn = Chef.create!(name: "Shawn")
    @chili = Dish.create!(name: "Chili", description: "spicy", chef_id: @shawn.id)
    @ingredient1 = @chili.ingredients.create!(name: "Black Beans", calories: 20)
    @ingredient2 = @chili.ingredients.create!(name: "Pinto Beans", calories: 20)
    @ingredient3 = @chili.ingredients.create!(name: "Quinoa", calories: 30)
    @ingredient4 = @chili.ingredients.create!(name: "Hatch Green Chiles", calories: 10)
    @ingredient5 = @chili.ingredients.create!(name: "Dried Pequin", calories: 5)
    @ingredient6 = @chili.ingredients.create!(name: "Canned Hominey", calories: 15)
  end

  it 'gives dish name and description' do
    visit "/dishes/#{@chili.id}"

    expect(page).to have_content(@chili.name)
    expect(page).to have_content(@chili.description)
  end

  it 'gives ingredients of dish' do
    visit "/dishes/#{@chili.id}"
    #save_and_open_page
    expect(page).to have_content(@ingredient1.name)
    expect(page).to have_content(@ingredient2.name)
    expect(page).to have_content(@ingredient3.name)
    expect(page).to have_content(@ingredient4.name)
    expect(page).to have_content(@ingredient5.name)
    expect(page).to have_content(@ingredient6.name)
  end

  it 'gives total calorie count for dish' do
    visit "/dishes/#{@chili.id}"

    expect(page).to have_content("Total Calories: 100")
  end

  it 'gives chef name for dish' do 
    visit "/dishes/#{@chili.id}"

    expect(page).to have_content("Chef for this Dish: Shawn")
  end
end