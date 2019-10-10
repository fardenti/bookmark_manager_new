#
require 'bookmark'
require 'comment'
require 'database_helper'

describe Bookmark do
  let(:comment_class) { double(:comment_class) }

  describe '#all' do
    it "returns a list of bookmarks" do
    connection = PG.connect(dbname: 'bookmark_manager_test')
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

  describe '#delete' do
    it 'delete selected url from bookmark' do
      connection = PG.connect(dbname: 'bookmark_manager_test')
      Bookmark.create('facebook', 'http://www.facebook.com')
      bookmarks = Bookmark.all
      expect(bookmarks.first.title).to eq('facebook')
      Bookmark.delete(id: bookmarks.first.id)
      expect(Bookmark.all.length).to eq 0
    end
  end

  describe '#update' do
    it 'can update the bookmark' do
      bookmark = Bookmark.create('facebook', 'http://www.facebook.com')
      updated_bookmark = Bookmark.update(id: bookmark.id,title: 'Facebook', url: 'http://www.facebook.com')
      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.title).to eq 'Facebook'
      expect(updated_bookmark.url).to eq 'http://www.facebook.com'
    end
  end

  describe '.find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
      result = Bookmark.find(id: bookmark.id)
      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe 'validation' do
    it 'will not allow the user to add a bookmark with invalid URL' do
      Bookmark.create('Google', 'google.com')
      expect(Bookmark.all).not_to include('Google')
    end
  end

  describe '#comments' do
  it 'calls .where on the Comment class' do
    bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
    expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)
    bookmark.comments(comment_class)
  end
end
end
