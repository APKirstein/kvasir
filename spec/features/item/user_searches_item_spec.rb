require "rails_helper"
feature "user visits items search", %{
  As a user
  I want to visit the items search
  So I can search for a specific item
} do
  # Acceptance Criteria:
  # [ ] - I must be able to click link
  # [ ] - I must be able to see search field
  # [ ] - I must be able to enter a search
  # [ ] - I am brought to the item show page

  let!(:user) { FactoryGirl.create(:user) }

  context "user is logged in" do
    scenario "user visits the items search" do
      sign_in_as(user)
      visit root_path
      click_link("Item lookup")

      expect(page).to have_content("Search")
    end

    scenario "user visits the items index" do
      sign_in_as(user)
      visit root_path
      click_link("Market Data")

      expect(page).to_not have_content("Sign In")
    end
  end

  context "user is not logged in" do
    scenario "visitor visits the items index" do
      visit root_path
      click_link("Market Data")

      expect(page).to_not have_content("Kvasir Index")
    end

    scenario "visitor visits the items index" do
      visit root_path
      click_link("Market Data")

      expect(page).to have_content("Sign In")
    end
  end
end
