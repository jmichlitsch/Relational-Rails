require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "I visit a Vehicle show page" do
    it "then I see only that vehicle" do
      dealership1 = Dealership.create(name: "joes",
                          max_inventory: 150,
                          in_county: true)
      vehicle1 = dealership1.vehicles.create(name: "S Class",
                                           passenger_limit: 5,
                                           auto_transmission: true)
    visit "/vehicles/#{vehicle1.id}"
    expect(page).to have_content(vehicle1.id)
    expect(page).to have_content(vehicle1.name)
    expect(page).to have_content(vehicle1.passenger_limit)
    expect(page).to have_content(vehicle1.auto_transmission)
    expect(page).to have_content(vehicle1.created_at)
    expect(page).to have_content(vehicle1.updated_at)

    end

    describe "I can update the snow" do
      it "by pressing the update button" do
        dealership1 = Dealership.create(name: "joes",
                            max_inventory: 150,
                            in_county: true)
        vehicle1 = dealership1.vehicles.create(name: "S Class",
                                             passenger_limit: 5,
                                             auto_transmission: true)
      visit "/vehicles/#{vehicle1.id}"
      expect(page).to have_link("Update Vehicle")
      click_link("Update Vehicle")
      expect(current_path).to eq("/vehicles/#{vehicle1.id}/edit")
      end

      describe "I can delete a vehicle" do
        it "by pressing the delete button" do
          dealership1 = Dealership.create(name: "joes",
                              max_inventory: 150,
                              in_county: true)
          vehicle1 = dealership1.vehicles.create(name: "S Class",
                                               passenger_limit: 5,
                                               auto_transmission: true)
        visit "/vehicles/#{vehicle1.id}"
        expect(page).to have_button("delete")
        click_button("delete")
        expect(current_path).to eq("/vehicles")
      end
      end
    end
  end
end
