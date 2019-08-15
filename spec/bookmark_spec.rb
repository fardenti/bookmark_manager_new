#
require 'bookmark'
describe Bookmark do
  describe '#all' do
    it "returns a list of bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
      # Add the test data
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('lwlies', 'http://www.lwlies.com');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('youtube', 'http://www.youtube.com');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('google', 'http://www.google.com');")

    bookmarks = Bookmark.all

    expect(bookmarks).to include('lwlies')
    expect(bookmarks).to include('youtube')
    expect(bookmarks).to include('google')
    end
  end

  describe '#create' do
    it 'add a new url and title to database' do
      Bookmark.create('facebook', 'http://www.facebook.com')
      bookmarks = Bookmark.all
      expect(bookmarks).to include('facebook')
    end
  end

end
