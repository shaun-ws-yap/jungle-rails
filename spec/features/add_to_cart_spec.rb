require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "Add an item to cart" do
    # ACT
    visit root_path

    # clicking add to cart button
    first('.product').find_button("Add").click

    # checking to see if cart is added
    find_link("My Cart (1)").click
    expect(page).to have_content 'Price'

    # DEBUG / VERIFY
    # save_screenshot

  end
end
