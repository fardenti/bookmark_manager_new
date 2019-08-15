require 'pg'

class Bookmark

  def initialize
    @bookmark = bookmark
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("SELECT * FROM bookmarks")
    result.map { |bookmark| bookmark['title'] }
  end

  def self.create(title, url)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    sql = "INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}');"
    result = connection.exec(sql)
  end

end
