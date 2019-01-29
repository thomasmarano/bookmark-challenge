require 'bookmark'



describe Bookmark do

    subject(:bookmark) {Bookmark.new}

    describe '.all' do
        it 'responds to method' do
            expect(Bookmark).to respond_to(:all)
        end

        it 'returns a list of all Bookmarks' do
            connection = PG.connect(dbname: 'bookmark_manager_test')

            connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
            connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
            connection.exec("INSERT INTO bookmarks (url) VALUES('https://www.google.com');")

            bookmarks = Bookmark.all

            expect(bookmarks).to include('https://www.google.com')
            expect(bookmarks).to include('http://www.makersacademy.com')
            expect(bookmarks).to include('http://www.destroyallsoftware.com')
        end
    end

    describe 'add_bookmark' do
        it 'responds to method' do

            expect(bookmark).to respond_to(:add_bookmark).with(1).argument
        end
    end
end
