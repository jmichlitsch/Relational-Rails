require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "I visit a Dealership show page" do
    it "then I see only that dealership's vehicles" do
      dealership1 = Dealership.create(name: "joes",
                                      max_inventory: 150,
                                      in_county: true)
    visit "/dealerships/#{dealership1.id}"
    expect(page).to have_content(dealership1.id)
    expect(page).to have_content(dealership1.name)
    expect(page).to have_content(dealership1.in_county)
    expect(page).to have_content(dealership1.created_at)
    expect(page).to have_content(dealership1.updated_at)
    expect(page).to have_content(dealership1.vehicles.count)
    end

    describe "I can update the dealership" do
      it "by pressing the update button" do
        dealership1 = Dealership.create(name: "joes",
                                        max_inventory: 150,
                                        in_county: true)
      visit "/dealerships/#{dealership1.id}"
      expect(page).to have_link("Update Dealership")
      click_link("Update Dealership")
      expect(current_path).to eq("/dealerships/#{dealership1.id}/edit")
      end

      describe "I can delete a dealership" do
        it "by pressing the delete button" do
          dealership1 = Dealership.create(name: "joes",
                                          max_inventory: 150,
                                          in_county: true)
        visit "/dealerships/#{dealership1.id}"
        expect(page).to have_button("delete")
        click_button("delete")
        expect(current_path).to eq("/dealerships")
      end
      end

      describe "I can see link to dealership vehicles" do
        it "takes me to dealership vehicles" do
          dealership1 = Dealership.create(name: "joes",
                                          max_inventory: 150,
                                          in_county: true)
        visit "/dealerships/#{dealership1.id}"
        expect(page).to have_link("Dealership Vehicles")
        click_link("Dealership Vehicles")
        expect(current_path).to eq("/dealerships/#{dealership1.id}/autos")

    #   describe "At the top of the page" do
    #   it "show links to every index" do
    #     dealership1 = Dealership.create(name: "joes",
    #                                     max_inventory: 150,
    #                                     in_county: true)
    #     visit "/dealerships/#{dealership1.id}"
    #     click_link "Dealership Index"
    #     expect(current_path).to eq('/dealerships')
    #
    #     visit "/dealerships/#{dealership1.id}"
    #     click_link "Vehicle Index"
    #     expect(current_path).to eq('/vehicles')
    #
    #     visit "/dealerships/#{dealership1.id}"
    #     click_link "Shop Index"
    #     expect(current_path).to eq('/shops')
    #
    #     visit "/dealerships/#{dealership1.id}"
    #     click_link"Snowboard Index"
    #     expect(current_path).to eq('/snowboards')
    #   end
    # end
        end
      end
    end
  end
end
#vehicle1 = dealership1.vehicles.create(name: "S Class",
#                                        passenger_limit: 5,
#                                        auto_transmission: true)
# vehicle2 = dealership1.vehicles.create(name: "E Class",
#                                        passenger_limit: 5,
#                                        auto_transmission: true)
# visit "/dealerships/#{dealership1.id}"
# expect(page).to have_content(vehicle1.name)
# expect(page).to have_content(vehicle1.passenger_limit)
# expect(page).to have_content(vehicle1.auto_transmission)
# expect(page).to have_content(vehicle1.created_at)
# expect(page).to have_content(vehicle1.updated_at)
#
# expect(page).to have_content(vehicle2.name)
# expect(page).to have_content(vehicle2.passenger_limit)
# expect(page).to have_content(vehicle2.auto_transmission)
# expect(page).to have_content(vehicle2.created_at)
# expect(page).to have_content(vehicle2.updated_at)
