require 'rails_helper'
RSpec.describe 'Autos Index' do
  it "can see all dealership vehicles names and created at time" do
    dealership1 = Dealership.create(name: "joes",
                                    max_inventory: 150,
                                    in_county: false)
    vehicle1 = dealership1.vehicles.create(name: "S Class",
                                 passenger_limit: 5,
                                 auto_transmission: true)
    vehicle2 = dealership1.vehicles.create(name: "E Class",
                                           passenger_limit: 5)

  visit "/dealerships/#{dealership1.id}/autos"

  expect(page).to have_link("#{vehicle1.name}")
  expect(page).to have_content("#{vehicle1.passenger_limit}")
  expect(page).to have_content("#{vehicle1.auto_transmission}")
  expect(page).to have_content("#{vehicle1.created_at}")
  expect(page).to have_content("#{vehicle1.updated_at}")
  expect(page).to have_link("Update Vehicle")
  expect(page).to have_button("delete")
  expect(page).to have_link("New Vehicle")
  end
end
