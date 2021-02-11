require 'rails_helper'

RSpec.describe 'Edit Shop' do
  describe 'As a visitor' do
    describe 'When I visit the shop index' do
      it 'I can update a shop' do
        shop1 = Shop.create(name: "joes",
                                        square_footage: 150,
                                        parking_lot: true)

        visit '/shops'

        click_link 'Update shop'

        expect(current_path).to eq("/shops/#{shop1.id}/edit")

        fill_in 'shop[name]', with: "You"
        fill_in "Square Footage", with: 1500
        check "Is there a parking lot?"
        click_button "Update shop"

        expect(current_path).to eq("/shops/#{shop1.id}")
        expect(page).to have_content('You')

        visit '/shops'
        click_link "Update shop"
        fill_in 'shop[name]', with: "Me"
        fill_in "Square Footage", with: 1500
        click_button "Update shop"
      end
    end
  end
end
