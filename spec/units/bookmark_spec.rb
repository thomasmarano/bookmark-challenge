require 'bookmark'

describe Bookmark do

    subject(:bookmark) {Bookmark.new}

    describe '.all' do
        it 'responds to method' do
            expect(Bookmark).to respond_to(:all)
        end

        it 'returns a list of all Bookmarks' do
            bookmarks = Bookmark.all
            expect(bookmarks).to include('https://www.google.com')
            expect(bookmarks).to include('https://www.facebook.com')
            expect(bookmarks).to include('https://www.twitter.com')
        end
    end
end
