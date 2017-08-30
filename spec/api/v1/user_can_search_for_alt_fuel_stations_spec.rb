require 'rails_helper'

describe "User Search" do
  scenario "user can search for alt fuel stations by zip code" do
    brandon = User.create
    visit "/"
    fill_in "80203"
    click_on "Locate"
    expect(page).to be("/search")
    expect(page).to have_content("top 10 closest stations; propane and electric")
    expect(page).to have_content("Name:")
    expect(page).to have_content("Address:")
    expect(page).to have_content("Fuel Types:")
    expect(page).to have_content("Distance:")
    expect(page).to have_content("Access Times:")
    expect(page).to not_have_content("coal stations:")
  end
end
