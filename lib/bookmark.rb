class Bookmark
    attr_reader :list

    def initialize
        @list = ['https://www.google.com', 'https://www.facebook.com']
    end

    def all
        @list
    end

end
