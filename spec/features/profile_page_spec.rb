require 'rails_helper'

feature 'view profile page', %Q(
  As an authenticated user
  I want to see my profile page
  So that I can change information on it
  ) do

    # Acceptance Criteria:
    # * I may view my profile page
    # * Profile displays email address

    scenario 'authenticated user views profile' do
      @user = FactoryGirl.create(:user)
      login_as(@user)
      visit root_path

      click_on 'View My Profile'

      expect(page).to have_content @user.email
    end

    scenario 'unauthenticated cannot view profile' do
      visit root_path

      expect(page).to_not have_content('View My Profile')
    end
  end
