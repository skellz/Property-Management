require 'spec_helper'

feature "user adds new owner", %q{
  As a real estate associate
  I want to correlate an owner with buildings
  So that I can refer back to pertinent information
} do 

  # Acceptance Criteria:

  # I must specify a first name, last name, and email address
  # I can optionally specify a company name
  # If I do not specify the required information, I am presented with errors
  # If I specify the required information, the owner is recorded and I am redirected to enter another new owner

  context "with valid attributes" do 
    it "creates a new owner" do 
      visit 'owners/new'

      fill_in "First name", with: "John"
      fill_in "Last name", with: "Smith"
      fill_in "Email", with: "go@new.com"
      fill_in "Company", with: "Nice!"
      click_on "Create owner"

      expect(page).to have_content "Owner was successfully created"
    end
  end

  context "with invalid attributes" do 
    it "raises an error for required fields" do 
      visit 'owners/new'
      click_on "Create Owner"

      expect(page).to have_content "can't be blank"
    end
  end
end
