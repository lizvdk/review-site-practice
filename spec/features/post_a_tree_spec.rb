require 'rails_helper'

feature 'post a tree', %Q(
  As a user
  I want to post a Christmas tree
  So I can share it with others
  ) do

  # Acceptance Criteria:
  # * I must provide a title that is at least 5 characters long
  # * I must provide a description that is at least 10 characters long
  # * I may upload a photo
  # * I must be presented with errors if I fill out the form incorrectly

  scenario 'authenticated user posts a tree with valid attributes' do
    @user = FactoryGirl.create(:user)
    tree = FactoryGirl.build(:tree)
    login_as(@user)
    visit root_path

    click_on 'Add a Christmas Tree'

    fill_in 'Title', with: tree.title
    fill_in 'Description', with: tree.description
    click_on 'Submit'

    expect(page).to have_content 'Tree submitted successfully'
    expect(page).to have_content tree.title
    expect(page).to have_content tree.description
  end
  scenario 'authenticated user posts a tree with invalid attributes' do
    @user = FactoryGirl.create(:user)
    login_as(@user)
    visit root_path

    click_on 'Add a Christmas Tree'
    click_on 'Submit'

    expect(page).to have_content "Title can't be blank"
    expect(page).to have_content "Description can't be blank"
  end

  scenario 'unauthenticated cannot post a tree' do
    visit new_tree_path

    expect(page).to have_content 'You need to sign in or sign up before
                                  continuing.'
  end
end
