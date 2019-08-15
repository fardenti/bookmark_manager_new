require 'pg'
require 'spec_helper'

feature 'Add url' do
  scenario 'can add new url and title, title shows on page' do
      Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
      visit('/bookmarks')
      expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
   end
end
