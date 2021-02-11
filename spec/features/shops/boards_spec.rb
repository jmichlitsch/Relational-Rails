require 'rails_helper'
RSpec.describe 'Boards Index' do
  it "can see all shop snowboards names and created at time" do
    shop1 = Shop.create(name: "joes",
                              square_footage: 150,
                              parking_lot: false)
    snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                         length: 5,
                                         wide_stance: true)
    snowboard2 = shop1.snowboards.create(name: "Turbo Dream 2",
                                         length: 5)

  visit "/shops/#{shop1.id}/boards"

  expect(page).to have_link("#{snowboard1.name}")
  expect(page).to have_content("#{snowboard1.length}")
  expect(page).to have_content("#{snowboard1.wide_stance}")
  expect(page).to have_content("#{snowboard1.created_at}")
  expect(page).to have_content("#{snowboard1.updated_at}")
  expect(page).to have_link("Update Snowboard")
  expect(page).to have_button("delete")
  expect(page).to have_link("New Board")
  end
end
