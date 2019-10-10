# frozen_string_literal: true
require 'bookmarktag'
describe BookmarkTag do
 describe '.create' do
   it 'creates a link between a bookmark and a tag' do
    bookmark = Bookmark.create('Makers Academy', 'http://www.makersacademy.com')
     tag = Tag.create(content: 'test tag')
     bookmarks_tag = BookmarkTag.create(bookmark_id: bookmark.id, tag_id: tag.id)
     expect(bookmarks_tag).to be_a BookmarkTag
     expect(bookmarks_tag.tag_id).to eq tag.id
     expect(bookmarks_tag.bookmark_id).to eq bookmark.id
   end
 end
end