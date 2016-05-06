require_relative '../spec_helper'
feature "filtering tags" do
  before(:each) do
    Link.create(title: "non-buble link",url: 'https://www.blabla.com', tags: [Tag.first_or_create(name: 'school')])
    Link.create( title: "bubble link title",url: 'https://www.bubble.com', tags: [Tag.first_or_create(name: 'bubbles')])
    Link.create( title: "second bubble title", url: 'https://www.one-more-bubble.com', tags: [Tag.first_or_create(name: 'bubbles')])

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
