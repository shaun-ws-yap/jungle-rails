require 'rails_helper'

RSpec.feature "Visitor navigates to product listing", type: :feature, js: true do

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

  scenario "Clicking a product from homepage brings user to product listing page" do
    # ACT
    visit root_path

    # click on first product link it finds
    first('h4').click
    

    expect(page).to have_css '.product-detail'

    # DEBUG / VERIFY
    # save_screenshot

  end
end
