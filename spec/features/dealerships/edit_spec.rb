require 'rails_helper'

RSpec.describe 'Edit Dealership' do
  describe 'As a visitor' do
    describe 'When I visit the dealership index' do
      it 'I can update a dealership' do
        dealership1 = Dealership.create(name: "joes",
                                        max_inventory: 150,
                                        in_county: true)

        visit '/dealerships'

        click_link 'Update Dealership'

        expect(current_path).to eq("/dealerships/#{dealership1.id}/edit")

        fill_in 'dealership[name]', with: "You"
        fill_in "Lot Size", with: 1500
        check "Is it in county?"
        click_button "Update Dealership"

        expect(current_path).to eq("/dealerships/#{dealership1.id}")
        expect(page).to have_content('You')

        visit '/dealerships'
        click_link "Update Dealership"
        fill_in 'dealership[name]', with: "Me"
        fill_in "Lot Size", with: 1500
        click_button "Update Dealership"
      end
    end
  end
end
