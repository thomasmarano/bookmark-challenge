require 'bookmark'



describe Bookmark do

    subject(:bookmark) {Bookmark.new}

    describe '.all' do
        it 'responds to method' do
            expect(Bookmark).to respond_to(:all)
        end

        it 'returns a list of all Bookmarks' do
            connection = PG.connect(dbname: 'bookmark_manager_test')

            Bookmark.create('http://www.makersacademy.com', 'Makers')
            Bookmark.create('http://www.destroyallsoftware.com', 'Destroy All')
            Bookmark.create('https://www.google.com', 'Google')


            bookmarks = Bookmark.all

            expect(bookmarks).to include('Makers')
            expect(bookmarks).to include('Google')
            expect(bookmarks).to include('Destroy All')
        end
    end

    describe 'add_bookmark' do
        it 'responds to method' do

            expect(Bookmark).to respond_to(:create).with(2).argument
        end
    end
end
