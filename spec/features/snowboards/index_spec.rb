require 'rails_helper'

RSpec.describe 'Snowboard Index' do
  it "can see all snowboards names and created at time" do
    shop1 = Shop.create(name: "joes",
                              square_footage: 150,
                              parking_lot: false)
    snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                         length: 5,
                                         wide_stance: true)
    snowboard2 = shop1.snowboards.create(name: "Turbo Dream 2",
                                         length: 5,
                                          wide_stance: true)
  visit "/snowboards"

  expect(page).to have_link(snowboard1.name)
  expect(page).to have_content(snowboard1.length)
  expect(page).to have_content(snowboard1.wide_stance)
  expect(page).to have_content(snowboard1.id)
  expect(page).to have_content(snowboard1.created_at)
  expect(page).to have_content(snowboard1.updated_at)
  expect(page).to have_link(snowboard2.name)
  end

  describe 'Does it have Update Links' do
    it "can see all update links in each snowboard" do
      shop1 = Shop.create(name: "joes",
                                square_footage: 150,
                                parking_lot: false)
      snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                           length: 5,
                                           wide_stance: true)
      snowboard2 = shop1.snowboards.create(name: "Turbo Dream 2",
                                           length: 5,
                                            wide_stance: true)
    visit "/snowboards"

  expect(page).to have_link("Update Snowboard", count:2)
  end

  describe 'Can it delete snowboards' do
    it "can delete the snowboard associated with the button" do
      shop1 = Shop.create(name: "joes",
                                square_footage: 150,
                                parking_lot: false)
      snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                           length: 5,
                                           wide_stance: true)
      snowboard2 = shop1.snowboards.create(name: "Turbo Dream 2",
                                           length: 5,
                                            wide_stance: true)
      visit "/snowboards"
      click_button("delete", match: :first)
      expect(page).to have_link("Update Snowboard", count:1)
      end
    end
  end
end
