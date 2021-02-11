require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "I visit a Shop show page" do
    it "then I see only that shop's snowboards" do
      shop1 = Shop.create(name: "joes",
                                      square_footage: 150,
                                      parking_lot: true)
    visit "/shops/#{shop1.id}"
    expect(page).to have_content(shop1.id)
    expect(page).to have_content(shop1.name)
    expect(page).to have_content(shop1.square_footage)
    expect(page).to have_content(shop1.parking_lot)
    expect(page).to have_content(shop1.created_at)
    expect(page).to have_content(shop1.updated_at)
    expect(page).to have_content(shop1.snowboards.count)
    end

    describe "I can update the shop" do
      it "by pressing the update button" do
        shop1 = Shop.create(name: "joes",
                                        square_footage: 150,
                                        parking_lot: true)
      visit "/shops/#{shop1.id}"
      expect(page).to have_link("Update shop")
      click_link("Update shop")
      expect(current_path).to eq("/shops/#{shop1.id}/edit")
      end

      describe "I can delete a shop" do
        it "by pressing the delete button" do
          shop1 = Shop.create(name: "joes",
                                          square_footage: 150,
                                          parking_lot: true)
        visit "/shops/#{shop1.id}"
        expect(page).to have_button("delete")
        click_button("delete")
        expect(current_path).to eq("/shops")
      end
      end

      describe "I can see link to shop snowboards" do
        it "takes me to shop snowboards" do
          shop1 = Shop.create(name: "joes",
                                          square_footage: 150,
                                          parking_lot: true)
        visit "/shops/#{shop1.id}"
        expect(page).to have_link("Shop's Boards")
        click_link("Shop's Boards")
        expect(current_path).to eq("/shops/#{shop1.id}/boards")

        end
      end
    end
  end
end
