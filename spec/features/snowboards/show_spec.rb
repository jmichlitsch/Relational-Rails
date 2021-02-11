require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "I visit a Snowboard show page" do
    it "then I see only that snowboard" do
      shop1 = Shop.create(name: "joes",
                          square_footage: 150,
                          parking_lot: true)
      snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                           length: 5,
                                           wide_stance: true)
    visit "/snowboards/#{snowboard1.id}"
    expect(page).to have_content(snowboard1.id)
    expect(page).to have_content(snowboard1.name)
    expect(page).to have_content(snowboard1.length)
    expect(page).to have_content(snowboard1.wide_stance)
    expect(page).to have_content(snowboard1.created_at)
    expect(page).to have_content(snowboard1.updated_at)

    end

    describe "I can update the snow" do
      it "by pressing the update button" do
        shop1 = Shop.create(name: "joes",
                            square_footage: 150,
                            parking_lot: true)
        snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                             length: 5,
                                             wide_stance: true)
      visit "/snowboards/#{snowboard1.id}"
      expect(page).to have_link("Update Snowboard")
      click_link("Update Snowboard")
      expect(current_path).to eq("/snowboards/#{snowboard1.id}/edit")
      end

      describe "I can delete a snowboard" do
        it "by pressing the delete button" do
          shop1 = Shop.create(name: "joes",
                              square_footage: 150,
                              parking_lot: true)
          snowboard1 = shop1.snowboards.create(name: "Turbo Dream",
                                               length: 5,
                                               wide_stance: true)
        visit "/snowboards/#{snowboard1.id}"
        expect(page).to have_button("delete")
        click_button("delete")
        expect(current_path).to eq("/snowboards")
      end
      end
    end
  end
end
