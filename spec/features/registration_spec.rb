require 'rails_helper'


RSpec.feature "Registration" do
  scenario "User signs up, logs out, logs back in" do
    visit "/"
    click_link_or_button "Sign_up"
    fill_in "Email", with: "katz@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_link_or_button "Sign up"

    expect(User.find_by(email: "katz@example.com")).to be_present

    expect(page).to have_content "Welcome! You have signed up successfully."

    click_link_or_button "Logout"

    expect(page).to have_content "Signed out successfully."


  end
end


# before (:each) do
#         @admin = FactoryGirl.create(:administrator)
#         sign_in @admin
#       end