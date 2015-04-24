require 'rails_helper'


RSpec.feature "Registration" do
  scenario "User signs up, logs out, logs back in" do
    visit "/"
    click_link_or_button "Sign up"
    fill_in "Email", with: "katz@example.com"
    fill_in "Password", with: "password"
    fill_in "Password Confirmation", with: "password"
    click_link_or_button "Submit"


    expext(page).to have_content "Welome katz@example.com"
  end
end