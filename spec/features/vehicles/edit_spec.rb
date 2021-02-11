require 'rails_helper'

RSpec.describe 'Edit Vehicle' do
  describe 'As a visitor' do
    describe 'When I visit the vehicle index' do
      it 'I can update a vehicle' do
        dealership1 = Dealership.create(name: "joes",
                                        max_inventory: 150,
                                        in_county: true)
        vehicle1 = dealership1.vehicles.create(name: "Turbo Dream",
                                              passenger_limit: 5,
                                              auto_transmission: true)
        visit '/vehicles'

        click_link 'Update Vehicle'

        expect(current_path).to eq("/vehicles/#{vehicle1.id}/edit")

        fill_in 'vehicle[name]', with: "S Class"
        fill_in "Passenger Limit:", with: 5
        check "Is it an automatic transmission?"
        click_button "Update Vehicle"

        expect(current_path).to eq("/vehicles/#{vehicle1.id}")
        expect(page).to have_content('S Class')

        visit '/vehicles'
        click_link "Update Vehicle"
        fill_in 'vehicle[name]', with: "E Class"
        fill_in "Passenger Limit:", with: 5
        click_button "Update Vehicle"
      end
    end
  end
end
