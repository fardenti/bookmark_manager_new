require 'pg'
require 'spec_helper'

feature 'Update url' do
  scenario 'can update data from bookmark' do
    bookmark = Bookmark.create('Facebook', 'http://www.facebook.com')
    visit('/bookmarks')
    expect(page).to have_link('Facebook', href: 'http://www.facebook.com')
    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('title', with: "Snakers Academy")
    fill_in('url', with: "http://www.snakersacademy.com")
    click_button('Update')

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Facebook', href: 'http//:www.facebook.com')
    expect(page).to have_link('Snakers Academy', href: 'http://www.snakersacademy.com')
  end
end