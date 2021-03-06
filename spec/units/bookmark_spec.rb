require 'bookmark'
require 'database_helpers'

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

            p 'TEST'
            p bookmark
            p 'TEST'
            p bookmarks
            p 'TEST'

            expect(bookmarks.length).to eq 3
            expect(bookmarks.first).to be_a Bookmark
            expect(bookmarks.first.id).to eq(bookmark.id)
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
            bookmark = Bookmark.create('http://testbookmark.com', 'Test Bookmark')
            persisted_data = persisted_data(bookmark.id)
            expect(bookmark).to be_a Bookmark
            expect(bookmark.id).to eq persisted_data['id']
            expect(bookmark.title).to eq 'Test Bookmark'
            expect(bookmark.url).to eq 'http://testbookmark.com'
        end

    end

    describe '#delete' do
        it 'deletes an existing bookmark' do
            bookmark = Bookmark.create('http://testbookmark.com', 'Test')
            Bookmark.delete(bookmark.id)
            expect(Bookmark.all.length).to eq(0)

        end
    end

    describe '#update' do
        it 'updates the bookmark with the given data' do
        bookmark = Bookmark.create('http://www.makersacademy.com', 'Makers Academy')
        updated_bookmark = Bookmark.update('http://www.snakersacademy.com', 'Snakers Academy', bookmark.id)


        expect(updated_bookmark.id).to eq bookmark.id
        expect(updated_bookmark.title).to eq 'Snakers Academy'
        expect(updated_bookmark.url).to eq 'http://www.snakersacademy.com'
  end
end
end
