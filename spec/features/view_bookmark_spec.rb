require 'pg'
require 'spec_helper'

feature 'view bookmarks' do
  scenario 'user can see bookmarks' do
    Bookmark.create('google', 'http://www.google.com')
    Bookmark.create('facebook', 'http://www.facebook.com')
    visit('/bookmarks')
    expect(page).to have_link('google')
    expect(page).to have_link('facebook')
  end

end
