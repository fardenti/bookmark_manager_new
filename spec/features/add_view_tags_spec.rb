require 'spec_helper'

feature 'Add and view tags' do
  scenario 'tags is added to the bookmark' do
    bookmark = Bookmark.create('google', 'http://www.google.com')
    visit '/bookmarks'
    first('.bookmark').click_button 'Add Tag'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"

      fill_in('tag', with: 'New tag')
      click_button 'Add'

      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmark')).to have_content 'New tag'
  end
end