require 'bookmark'

describe Bookmark do

    subject(:bookmark) {Bookmark.new}

    describe '#all' do
        it 'responds to method' do
            expect(subject).to respond_to(:all)
        end

        it 'returns a list of all Bookmarks' do
            expect{print bookmark.all}.to output{bookmark.list}.to_stdout
        end
    end
end
