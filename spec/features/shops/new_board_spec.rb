require 'rails_helper'

RSpec.describe 'New Board' do
  it "When I viist the new board form I can create a new board" do
    shop1 = Shop.create(name: "joes",
                        square_footage: 150,
                        parking_lot: false)
    visit "/shops/#{shop1.id}/boards/new_board"
    fill_in("Snowboard Name", with: "Turbo Dream")
    fill_in("Length", with: 4)
    check("Is it a wide stance board?")
    click_button('Submit')

    expect(current_path).to eq("/shops/#{shop1.id}/boards")
    expect(page).to have_link("Turbo Dream")

    visit "/shops/#{shop1.id}/boards/new_board"
    fill_in("Snowboard Name", with: "Turbo Dream 2")
    fill_in("Length", with: 4)
    click_button("Submit")

    expect(current_path).to eq("/shops/#{shop1.id}/boards")
    expect(page).to have_link("Turbo Dream 2")
  end
end
