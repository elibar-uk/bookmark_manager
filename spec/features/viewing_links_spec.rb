feature "filtering tags" do
  before(:each) do
    Link.create(url: 'https://www.blabla.com', title: "non-buble link", tags: [Tag.first_or_create(name: 'school')])
    Link.create(url: 'https://www.bubble.com', title: "bubble link title", tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create(url: 'https://www.one-more-bubble.com', title: "second bubble title", tags: [Tag.first_or_create(name: 'bubbles')])

  end
  scenario "filter links by tags" do
    visit('/tags/bubbles')
    expect(page.status_code).to eq(200)
     within 'ul#links' do
    expect(page).not_to have_content "non-buble link"
    expect(page).to have_content "bubble link title"
    expect(page).to have_content "second bubble title"
  end
end
end
