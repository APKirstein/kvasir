require 'rails_helper'

feature 'user visits items index', %{
  As a user
  I want to visit the items index
  So I can see the buy/sell prices of items
} do

  # Acceptance Criteria:
  # [ ] - I must be able to click link
  # [ ] - I must be able to see items
  # [ ] - If logged in I see Kvasir number
  # [ ] - If not logged in I don't see Kvasir number

  let!(:user) { FactoryGirl.create(:user) }

  context 'user is logged in' do
    scenario 'user visits the items index' do
      sign_in_as(user)
      visit root_path
      click_link("items")

      expect(page).to have_content("Kvasir Index")
    end

    scenario 'user visits the items index' do
      sign_in_as(user)
      visit root_path
      click_link("items")

      expect(page).to_not have_content("Sign In")
    end
  end

  context 'user is not logged in' do
    scenario 'visitor visits the items index' do
      visit root_path
      click_link("items")

      expect(page).to_not have_content("Kvasir Index")
    end

    scenario 'visitor visits the items index' do
      visit root_path
      click_link("items")

      expect(page).to have_content("Sign In")
    end
  end

end
