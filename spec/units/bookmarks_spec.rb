require 'bookmarks'

describe Bookmarks do

    subject(:bookmarks) {Bookmarks.new}

    describe '#all' do
        it 'returns a list of all Bookmarks' do
            expect{print bookmarks.all}.to output{bookmarks.list}.to_stdout
        end
    end
end
