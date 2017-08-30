# As a user
# When I visit "/"
# And I fill in the search form with 80203
# And I click "Locate"
# Then I should be on page "/search" with parameters visible in the url
# Then I should see a list of the 10 closest stations within 6 miles sorted by distance
# And the stations should be limited to Electric and Propane
# And for each of the stations I should see Name, Address, Fuel Types, Distance, and Access Times

require 'rails_helper'

describe "User Search" do
  scenario "user can search for alt fuel stations by zip code" do

    brandon = User.create(name: "Brandon")
    station = Station.create(name: "Station A", zip: "80203")

    visit '/'
    # select "80203", from: :zip_codes
    # click_on "Locate"
    expect(page).to have_content("all zip codes:")
    click_on "80203"
    expect(page).to be("/search")
    expect(page).to have_content("top 10 closest stations; propane and electric")
    expect(page).to have_css(".station", count: 10)
    expect(page).to have_content("Name:")
    expect(page).to have_content("Address:")
    expect(page).to have_content("Fuel Types:")
    expect(page).to have_content("Distance:")
    expect(page).to have_content("Access Times:")
    expect(page).to not_have_content("coal stations:")
  end
end
