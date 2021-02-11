require 'rails_helper'

RSpec.describe 'New Shop' do
  describe 'As a visitor' do
    describe 'When I visit the new shop form by clicking a link on the index' do
      it 'I can create a new shop' do
        visit '/shops'
        click_link("New Shop")
        expect(current_path).to eq("/shops/new")

        fill_in "Shop Name", with: "Austin"
        fill_in "shop[square_footage]", with: 1500
        check "Is there a parking lot?"
        click_button('Create Shop')

        expect(current_path).to eq("/shops")
        expect(page).to have_content("Austin")

        click_link("New Shop")
        expect(current_path).to eq("/shops/new")

        fill_in "Shop Name", with: "You"
        fill_in "shop[square_footage]", with: 1500
        click_button('Create Shop')
        expect(current_path).to eq("/shops")
        expect(page).to have_content("You")
      end
    end
  end
end
