require 'rails_helper'

RSpec.describe 'New Dealership' do
  describe 'As a visitor' do
    describe 'When I visit the new dealership form by clicking a link on the index' do
      it 'I can create a new dealership' do
        visit '/dealerships'
        click_link("New Dealership")
        expect(current_path).to eq("/dealerships/new")

        fill_in "Dealership Name", with: "Austin"
        fill_in "Lot Size", with: 1500
        check "Is it in county?"
        click_button('Create Dealership')

        expect(current_path).to eq("/dealerships")
        expect(page).to have_content("Austin")

        click_link("New Dealership")
        expect(current_path).to eq("/dealerships/new")

        fill_in "Dealership Name", with: "You"
        fill_in "Lot Size", with: 1500
        click_button('Create Dealership')
        expect(current_path).to eq("/dealerships")
        expect(page).to have_content("You")
      end
    end
  end
end
