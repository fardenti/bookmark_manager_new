CREATE TABLE bookmarks_tags(bookmark_id INTEGER REFERENCES bookmarks (id), tag_id INTEGER REFERENCES tags (id));