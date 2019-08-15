#
require 'bookmark'
describe Bookmark do
  describe '#all' do
    it "returns a list of bookmarks" do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      # Add the test data
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.lwlies.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.youtube.com');")
    connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('http://www.lwlies.com')
    expect(bookmarks).to include('http://www.youtube.com')
    expect(bookmarks).to include('http://www.google.com')
    end
  end

  describe '#create' do
    it 'add a new url and title to database' do
      Bookmark.create('http://www.facebook.com', 'facebook')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('http://www.facebook.com')
    end
  end

end
