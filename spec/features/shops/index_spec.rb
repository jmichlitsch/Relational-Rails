require 'rails_helper'

RSpec.describe 'Shops Index' do
  it "can see all shops names and created at time" do
    shop1 = Shop.create(name: "joes",
                         square_footage: 150,
                         parking_lot: true)
    shop2 = Shop.create(name: "harrys",
                         square_footage: 150,
                         parking_lot: true)
  visit "/shops"

  expect(page).to have_link(shop1.name)
  expect(page).to have_link(shop2.name)
  end

  describe 'Does it have Update Links' do
    it "can see all update links in each shop" do
      shop1 = Shop.create(name: "joes",
                                      square_footage: 150,
                                      parking_lot: true)
      shop2 = Shop.create(name: "harrys",
                                      square_footage: 150,
                                      parking_lot: true)
    visit "/shops"

  expect(page).to have_link("Update shop", count:2)
  end

  describe 'Can it delete shops' do
    it "can delete the shop associated with the button" do
      shop1 = Shop.create(name: "joes",
                                      square_footage: 150,
                                      parking_lot: false)
      shop2 = Shop.create(name: "harrys",
                                      square_footage: 150,
                                      parking_lot: true)
      visit "/shops"
      click_button("delete", match: :first)
      expect(page).to have_link("Update shop", count:1)
      end
    end
  end

  describe 'Can sort by highest child count' do
    it "can press button to sort child count" do
      shop1 = Shop.create(name: "joes",
                          square_footage: 150,
                          parking_lot: true)
      shop2 = Shop.create(name: "harrys",
                                      square_footage: 150,
                                      parking_lot: true)
      snowboard1 = shop2.snowboards.create(name: "X board",
                                             length: 5,
                                             wide_stance: true)
      visit '/shops'
      click_link("Child Count")
      expect(page).to have_link(shop1.name)
      expect(page).to have_link(shop2.name)
    end
  end
end
