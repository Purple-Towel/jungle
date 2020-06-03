require 'rails_helper'

RSpec.feature "Visitor navigates to product via homepage", type: :feature, js: true do
  
  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    1.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see a product and click on it" do
    # ACT
    visit root_path

    find('a.pull-right').click

    expect(page).to have_text("Description")

    # DEBUG / VERIFY
    save_screenshot

  end

end
