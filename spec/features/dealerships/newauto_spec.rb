require 'rails_helper'

RSpec.describe 'New Auto' do
  it "When I viist the new auto form I can create a new auto" do
    dealership1 = Dealership.create(name: "joes",
                                    max_inventory: 150,
                                    in_county: false)
    visit "/dealerships/#{dealership1.id}/autos/new_auto"
    fill_in("Vehicle Name", with: "S Class")
    fill_in("Passenger Limit", with: 4)
    check("Is it an automatic transmission?")
    click_button('Submit')

    expect(current_path).to eq("/dealerships/#{dealership1.id}/autos")
    expect(page).to have_link("S Class")

    visit "/dealerships/#{dealership1.id}/autos/new_auto"
    fill_in("Vehicle Name", with: "E Class")
    fill_in("Passenger Limit", with: 4)
    click_button("Submit")

    expect(current_path).to eq("/dealerships/#{dealership1.id}/autos")
    expect(page).to have_link("E Class")
  end
end
