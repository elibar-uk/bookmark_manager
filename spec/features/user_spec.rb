
require_relative '../spec_helper'
feature "user sign up" do
  scenario "when user sins up the count increases by 1" do
    # visit('/users/new')
    # expect(page.status_code).to eq 200
    # fill_in :email, with: "joe@gmail.com"
    # fill_in :password, with: "Obp23"

    expect{ sign_up }.to change(User, :count).by 1
    expect(page).to have_content "Welcome you! joe@gmail.com"
    expect(User.first.email).to eq "joe@gmail.com"

  end
  scenario "validation of the user password" do

    expect { sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
  end
end
