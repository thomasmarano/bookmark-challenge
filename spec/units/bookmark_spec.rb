require 'bookmark'

describe Bookmark do

    subject(:bookmark) {Bookmark.new}

    describe '.all' do
        it 'responds to method' do
            expect(Bookmark).to respond_to(:all)
        end

        it 'returns a list of all Bookmarks' do
            connection = PG.connect(dbname: 'bookmark_manager_test')

            bookmark = Bookmark.create('http://www.makersacademy.com', 'Makers')
            Bookmark.create('http://www.destroyallsoftware.com', 'Destroy All')
            Bookmark.create('https://www.google.com', 'Google')


            bookmarks = Bookmark.all

            expect(bookmarks.length).to eq 3
            expect(bookmarks.first).to be_a Bookmark
            expect(bookmarks.first.id).to eq(bookmark.first['id'])
            expect(bookmarks.first.title).to eq 'Makers'
            expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'

        end
    end

    describe '#add_bookmark' do
        it 'responds to method' do

            expect(Bookmark).to respond_to(:create).with(2).argument
        end
    end

    describe '#create' do
        it 'creates a new bookmark' do
            bookmark = Bookmark.create('http://testbookmark.com', 'Test Bookmark').first
            expect(bookmark['url']).to eq 'http://testbookmark.com'
            expect(bookmark['title']).to eq 'Test Bookmark'
        end

    end
end
