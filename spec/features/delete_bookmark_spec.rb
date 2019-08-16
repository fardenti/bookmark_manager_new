require 'pg'
require 'spec_helper'

feature 'Delete url' do
  scenario 'can delete data from bookmark' do
    bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    Bookmark.delete(id: bookmark.id)
    expect(Bookmark.all.length).to eq 0
  end
end