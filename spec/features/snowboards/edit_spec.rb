require 'rails_helper'

RSpec.describe 'Edit Snowboard' do
  describe 'As a visitor' do
    describe 'When I visit the snowboard index' do
      it 'I can update a snowboard' do
        shop1 = Shop.create(name: "joes",
                                        square_footage: 150,
                                        parking_lot: true)
        snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                             length: 5,
                                             wide_stance: true)
        visit '/snowboards'

        click_link 'Update Snowboard'

        expect(current_path).to eq("/snowboards/#{snowboard1.id}/edit")

        fill_in 'snowboard[name]', with: "You"
        fill_in "Length in cm", with: 1500
        check "Is it a wide stance board?"
        click_button "Update Snowboard"

        expect(current_path).to eq("/snowboards/#{snowboard1.id}")
        expect(page).to have_content('You')

        visit '/snowboards'
        click_link "Update Snowboard"
        fill_in 'snowboard[name]', with: "Me"
        fill_in "Length in cm", with: 1500
        click_button "Update Snowboard"
      end
    end
  end
end
