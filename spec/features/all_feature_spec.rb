# require_relative '../spec_helper'
# feature 'Viewing links' do #link_spec
#
#   scenario 'I can see existing links on the links page' do
#     Link.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
#     visit '/links'
#     expect(page.status_code).to eq 200
#
#     within 'ul#links' do
#       expect(page).to have_content('Makers Academy')
#     end
#   end
# end
#
# feature 'adding new links' do #create_links_spec
#   scenario 'add the address and the title to book manager'do
#     visit('/links/new')
#     fill_in('title', :with => 'Makers Academy/about-us')
#     fill_in('url', :with => 'http://www.makersacademy.com/about-us/')
#     click_button('add to links')
#
#     expect(current_path).to eq '/links'
#
#     within 'ul#links'do
#       expect(page).to have_content('http://www.makersacademy.com/about-us/')
#     end
#   end
# end
# feature 'adding tags to links' do
#   scenario "adds one tag to the link" do
#     visit('/links/new')
#     fill_in('title', :with => 'Makers Academy/about-us')
#     fill_in('url', :with => 'http://www.makersacademy.com/about-us/')
#     fill_in('tags', :with => 'education')
#     click_button('add to links')
#
#     link = Link.first
#     expect(link.tags.map(&:name)).to include 'education'
#   end
# end
#
# feature "filtering tags" do
#   before(:each) do
#     Link.create(url: 'https://www.blabla.com', title: "non-buble link", tags: [Tag.first_or_create(name: 'school')])
#     Link.create(url: 'https://www.bubble.com', title: "bubble link title", tags: [Tag.first_or_create(name: 'bubbles')])
#     Link.create(url: 'https://www.one-more-bubble.com', title: "second bubble title", tag: [Tag.first_or_create(name: 'bubbles')])
#
#   end
#   scenario "filter links by tags" do
#     visit('/tags/bubbles')
#     expect(page.status_code).to eq(200)
#      within 'ul#links' do
#     expect(page).not_to have_content "non-buble link"
#     expect(page).to have_content "bubble link title"
#     expect(page).to have_content "second bubble title"
#   end
# end
# end
