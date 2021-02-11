require 'rails_helper'

RSpec.describe 'Vehicle Index' do
  it "can see all vehicles names and created at time" do
    dealership1 = Dealership.create(name: "joes",
                              max_inventory: 150,
                              in_county: false)
    vehicle1 = dealership1.vehicles.create(name: "S Class",
                                         passenger_limit: 5,
                                         auto_transmission: true)
    vehicle2 = dealership1.vehicles.create(name: "E Class",
                                         passenger_limit: 5,
                                          auto_transmission: true)
  visit "/vehicles"

  expect(page).to have_link(vehicle1.name)
  expect(page).to have_content(vehicle1.passenger_limit)
  expect(page).to have_content(vehicle1.auto_transmission)
  expect(page).to have_content(vehicle1.id)
  expect(page).to have_content(vehicle1.created_at)
  expect(page).to have_content(vehicle1.updated_at)
  expect(page).to have_link(vehicle2.name)
  end

  describe 'Does it have Update Links' do
    it "can see all update links in each vehicle" do
      dealership1 = Dealership.create(name: "joes",
                                max_inventory: 150,
                                in_county: false)
      vehicle1 = dealership1.vehicles.create(name: "S Class",
                                           passenger_limit: 5,
                                           auto_transmission: true)
      vehicle2 = dealership1.vehicles.create(name: "E Class",
                                           passenger_limit: 5,
                                            auto_transmission: true)
    visit "/vehicles"

  expect(page).to have_link("Update Vehicle", count:2)
  end

  describe 'Can it delete vehicles' do
    it "can delete the vehicle associated with the button" do
      dealership1 = Dealership.create(name: "joes",
                                max_inventory: 150,
                                in_county: false)
      vehicle1 = dealership1.vehicles.create(name: "S Class",
                                           passenger_limit: 5,
                                           auto_transmission: true)
      vehicle2 = dealership1.vehicles.create(name: "E Class",
                                           passenger_limit: 5,
                                            auto_transmission: true)
      visit "/vehicles"
      click_button("delete", match: :first)
      expect(page).to have_link("Update Vehicle", count:1)
      end
    end
  end
end
