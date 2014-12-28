require 'rails_helper'

feature 'delete account', %Q(
  As an authenticated user
  I want to delete my account
  So that my information is no longer retained by the app
  ) do

  # Acceptance Criteria:
  # * User can delete account from profile page
  # * User is redirected to root

  scenario 'user deletes account' do
    @user = FactoryGirl.create(:user)
    login_as(@user)
    visit user_path(@user)

    click_on 'Delete Account'

    expect(page).to have_content 'Bye! Your account has been successfully
                                  cancelled. We hope to see you again soon.'
    expect(page).to have_content 'Christmas Trees!'
  end
end
