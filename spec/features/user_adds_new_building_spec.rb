require 'spec_helper'

feature "user adds a new building", %q{
  As a real estate associate
  I want to record a building
  So that I can refer back to pertinent information
} do 
  # Acceptance Criteria:

  # I must specify a street address, city, state, and postal code
  # Only US states can be specified
  # I can optionally specify a description of the building
  # If I enter all of the required information in the required format, the building is recorded.
  # If I do not specify all of the required information in the required formats, the building is not recorded and I am presented with errors
  # Upon successfully creating a building, I am redirected so that I can record another building.

  context "with valid attributes" do
    it "creates a building with valid attributes" do 
      visit '/buildings/new'

      fill_in "Street", with: "123 Main St"
      fill_in "City", with: "Brooklyn"
      select("NY", from: "State")
      fill_in "Zip code", with: "11223"
      fill_in "Description", with: "Amazing!!!" 
      click_on "Create Building"

      expect(page).to have_content "Building was successfully created"
    end
  end

  context "with invalid attributes" do 
    it "displays errors for missing fields" do 
      visit '/buildings/new'
      click_on "Create Building"

      expect(page).to have_content "can't be blank"
    end
  end
end