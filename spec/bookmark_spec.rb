#
require 'bookmark'
describe Bookmark do
  describe '#all' do
    it "returns a list of bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
      # Add the test data

    Bookmark.create('google', 'http://www.google.com')

    bookmarks = Bookmark.all

    expect(bookmarks.first.title).to eq('google')
    expect(bookmarks.first.url).to eq 'http://www.google.com'
    end
  end

  describe '#create' do
    it 'add a new url and title to database' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create('facebook', 'http://www.facebook.com')
      bookmarks = Bookmark.all
      expect(bookmarks.first.title).to eq('facebook')
    end
  end

end
