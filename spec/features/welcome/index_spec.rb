require 'rails_helper'

RSpec.describe "welcome index page"  do
  it "show links to every index" do

    visit "/"
    click_link "Dealerships"
    expect(current_path).to eq('/dealerships')

    visit "/"
    click_link "Vehicles"
    expect(current_path).to eq('/vehicles')

    visit "/"
    click_link "Shops"
    expect(current_path).to eq('/shops')

    visit "/"
    click_link"Snowboards"
    expect(current_path).to eq('/snowboards')
  end
end
