feature 'Adding and viewing comments' do
  feature 'a user can add and then view a comment' do
    scenario 'a comment is added to a bookmark' do
      bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')

      visit('/bookmarks')
      first('.bookmark').click_button 'Add Comment'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"

      fill_in('comment', with: 'This is a second comment')
      click_button 'Add'

      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmark')).to have_content 'This is a second comment'
    end
  end
end