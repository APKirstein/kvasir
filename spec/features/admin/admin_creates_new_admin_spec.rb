require "rails_helper"

feature "admin promotes new admin", %{
  As an administrator of Kvasir Markets
  I want to see a list of users via usernames and emails
  So that I can promote someone else to admin.
} do

  # Acceptance Criteria:
  # [ ] I must be logged in as an admin
  # [ ] I can create a new admin

  let!(:admin) { FactoryGirl.create(:user, admin: "t") }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "admin creates promotes new admin" do
    sign_in_as(admin)
    visit admin_users_path
    click_button "Make Admin"

    expect(page).to have_content(user.email)
    expect(page).to have_content("admin")
  end

  scenario "unauthorized users are redirected" do
    visit admin_users_path

    expect(page).to have_content("You are not authorized")
    expect(current_path).to eq(root_path)
  end
end
