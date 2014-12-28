require 'rails_helper'

feature 'view all trees', %Q(
  As a user
  I want to view recently posted trees
  So that I can see other people's trees
  ) do

  # Acceptance Criteria:
  # * I must see the title of each tree
  # * I must see trees listed in order, most recently posted first
  # * Tree titles link to their show page
  # * I must see if a tree was posted by an arborist or a candidate

  scenario 'trees display in order' do
    trees = FactoryGirl.create_list(:tree, 3)
    visit trees_path

    page.should have_selector('ul#trees li:nth-child(1)', text: trees[2].title)
    page.should have_selector(
                          'ul#trees li:nth-child(1)', text: trees[2].user.role)
    page.should have_selector('ul#trees li:nth-child(2)', text: trees[1].title)
    page.should have_selector(
                          'ul#trees li:nth-child(2)', text: trees[1].user.role)
    page.should have_selector('ul#trees li:nth-child(3)', text: trees[0].title)
    page.should have_selector(
                          'ul#trees li:nth-child(3)', text: trees[0].user.role)
  end

  scenario 'trees titles link to show' do
    trees = FactoryGirl.create_list(:tree, 3)
    visit trees_path

    click_on trees[0].title

    expect(page).to have_content trees[0].title
    expect(page).to have_content trees[0].description
  end
end
