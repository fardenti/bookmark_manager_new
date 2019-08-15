require 'pg'
require 'spec_helper'

feature 'Add url' do
  scenario 'can add new url' do
    visit('/bookmarks')
    fill_in('url', with: 'http://www.google.com')
    fill_in('title', with: 'google')
    click_button 'Add'
    expect(page).to have_content("google")
   end
end
