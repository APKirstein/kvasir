require 'rails_helper'

feature 'admin views list of users', %{
  As an administrator of Kvasir Markets
  I want to see a list of users via usernames and emails
  So that I can view who is using my website.
} do

  # Acceptance Criteria:
  # [ ] I must be logged in as an admin
  # [ ] I can visit create a new admin

  let!(:admin) { FactoryGirl.create(:user, admin: 't') }
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'admin views users' do
    sign_in_as(admin)
    visit admin_users_path

    expect(page).to have_content(user.email)
    expect(page).to have_content(user.admin)
  end

  scenario 'admin deletes user' do
    sign_in_as(admin)
    visit admin_users_path

    expect(page).to have_content("Create Admin")
  end

  scenario 'unauthorized users are redirected' do
    sign_in_as(user)
    visit admin_users_path

    expect(page).to have_content('not authorized')
    expect(current_path).to eq(root_path)
  end
end
