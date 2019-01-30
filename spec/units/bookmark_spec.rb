require 'bookmark'



describe Bookmark do

    subject(:bookmark) {Bookmark.new}

    describe '.all' do
        it 'responds to method' do
            expect(Bookmark).to respond_to(:all)
        end

        it 'returns a list of all Bookmarks' do
            connection = PG.connect(dbname: 'bookmark_manager_test')

            Bookmark.create('http://www.makersacademy.com')
            Bookmark.create('http://www.destroyallsoftware.com')
            Bookmark.create('https://www.google.com')

      
            bookmarks = Bookmark.all

            expect(bookmarks).to include('https://www.google.com')
            expect(bookmarks).to include('http://www.makersacademy.com')
            expect(bookmarks).to include('http://www.destroyallsoftware.com')
        end
    end

    describe 'add_bookmark' do
        it 'responds to method' do

            expect(Bookmark).to respond_to(:create).with(1).argument
        end
    end
end
