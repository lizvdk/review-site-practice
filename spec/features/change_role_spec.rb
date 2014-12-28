require 'rails_helper'

feature 'change role', %Q(
  As an authenticated user
  I can change my role on my profile page to arborist
  So I can post Christmas trees and review them as an arborist
  ) do

  scenario 'an authenticated user may change role' do
    @user = FactoryGirl.create(:user)
    login_as(@user)
    visit user_path(@user)

    click_on 'Edit Account'
    fill_in 'Role', with: 'arborist'
    fill_in 'Current password', with: @user.password
    click_on 'Update'

    expect(page).to have_content 'Your account has been updated successfully'
  end
end
