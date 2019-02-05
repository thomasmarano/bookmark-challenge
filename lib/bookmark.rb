require 'pg'

class Bookmark
    attr_reader :list, :id, :title, :url

    def initialize(id, title, url)
        @id = id
        @title = title
        @url = url
    end

    def self.all
        if ENV['ENVIRONMENT'] == 'test'
            connection = PG.connect(dbname: 'bookmark_manager_test')
        else
            connection = PG.connect(dbname: 'bookmark_manager')
        end

        result = connection.exec('SELECT * FROM bookmarks;')
        result.map do |bookmark|
            Bookmark.new(bookmark['id'], bookmark['title'], bookmark['url'])
        end


    end

    def self.create(url, title)
      if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'bookmark_manager_test')
      else
          connection = PG.connect(dbname: 'bookmark_manager')
      end
      result = connection.exec("INSERT INTO bookmarks (url, title) VALUES ('#{url}', '#{title}') RETURNING id, url, title")
      Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
    end


    def self.delete(id)
      if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'bookmark_manager_test')
      else
          connection = PG.connect(dbname: 'bookmark_manager')
      end
      result = connection.exec("DELETE FROM bookmarks WHERE id = #{id};")
    end

    def self.update(url, title, id)
      if ENV['ENVIRONMENT'] == 'test'
          connection = PG.connect(dbname: 'bookmark_manager_test')
      else
          connection = PG.connect(dbname: 'bookmark_manager')
      end

      result = connection.exec("UPDATE bookmarks SET url='#{url}', title='#{title}' WHERE id = '#{id}' RETURNING id, url, title;")
      Bookmark.new(result[0]['id'], result[0]['title'], result[0]['url'])
    end

end
