feature "user sign up" do
  scenario "when user sins up the count increases by 1" do
    visit('/users/new')
    expect(page.status_code).to eq 200
    fill_in :email, with: "joe@gmail.com"
    fill_in :password, with: "Obp23"

    expect{click_button('sign up')}.to change(User, :count).by 1
    expect(page).to have_content "Welcome you! joe@gmail.com"
    expect(User.first.email).to eq "joe@gmail.com"

  end
end
