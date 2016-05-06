def sign_up do
  visit('/users/new')
  expect(page.status_code).to eq 200
  fill_in :email, with: "joe@gmail.com"
  fill_in :password, with: "Obp23"
  click_button('sign up')
end
