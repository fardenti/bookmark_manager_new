require 'pg'
require 'spec_helper'

feature 'view bookmarks' do
  scenario '- user can see bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'google');")
    visit('/bookmarks')
    expect(page).to have_content('google')
  end

end
