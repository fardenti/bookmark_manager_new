require 'pg'
require 'spec_helper'

feature 'Delete url' do
  scenario 'can delete data from bookmark' do
    bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    Bookmark.delete(id: bookmark.id)
    expect(Bookmark.all.length).to eq 0
    # visit('/bookmarks')
    # fill_in('url', with: 'http://www.google.com')
    # fill_in('title', with: 'google')
    # click_button 'Add'
    # click_button 'Delete'
    # expect(page).to_not have_content("google")
  end
end