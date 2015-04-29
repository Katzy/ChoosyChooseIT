require 'rails_helper'

RSpec.feature 'Create ChooseIT Poll' do
  scenario "Guest generates a ChooseIT link" do
    visit "/"

    click_link_or_button "Create a ChooseIT"
    select 'People', from: "chooseIT_options"
    fill_in "Question", with: "Who should I ask out?"
    fill_in "Option 1", with: "Jimmy"
    fill_in "Option 2", with: "Johnny"
    fill_in "Recipients", with: "larry@example.com, honey@sweetpancakes.com"
    click_link_or_button "CREATE"

    expect(page).to have_content("Well Done.  Here's your ChooseIT link.  It has been emailed to all recipients")

  end

end