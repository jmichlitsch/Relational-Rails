require 'rails_helper'

RSpec.describe 'Dealership Index' do
  it "can see all dealerships names and created at time" do
    dealership1 = Dealership.create(name: "joes",
                                    max_inventory: 150,
                                    in_county: true)
    dealership2 = Dealership.create(name: "harrys",
                                    max_inventory: 150,
                                    in_county: true)
  visit "/dealerships"

  expect(page).to have_link(dealership1.name)
  expect(page).to have_link(dealership2.name)
  end

  describe 'Does it have Update Links' do
    it "can see all update links in each dealership" do
      dealership1 = Dealership.create(name: "joes",
                                      max_inventory: 150,
                                      in_county: true)
      dealership2 = Dealership.create(name: "harrys",
                                      max_inventory: 150,
                                      in_county: true)
    visit "/dealerships"

  expect(page).to have_link("Update Dealership", count:2)
  end

  describe 'Can it delete dealerships' do
    it "can delete the dealership associated with the button" do
      dealership1 = Dealership.create(name: "joes",
                                      max_inventory: 150,
                                      in_county: false)
      dealership2 = Dealership.create(name: "harrys",
                                      max_inventory: 150,
                                      in_county: true)
      visit "/dealerships"
      click_button("delete", match: :first)
      expect(page).to have_link("Update Dealership", count:1)
      end
    end
  end

  describe 'Can sort by highest child count' do
    it "can press button to sort child count" do
      dealership1 = Dealership.create(name: "joes",
                                      max_inventory: 150,
                                      in_county: true)
      dealership2 = Dealership.create(name: "harrys",
                                      max_inventory: 150,
                                      in_county: true)
      vehicle1 = dealership2.vehicles.create(name: "S Class",
                                             passenger_limit: 5,
                                             auto_transmission: true)
      visit '/dealerships'
      click_link("Child Count")
      expect(page).to have_link(dealership1.name)
      expect(page).to have_link(dealership2.name)
    end
  end
end
