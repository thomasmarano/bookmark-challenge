require 'sinatra/base'

require_relative 'lib/bookmarks'



class BookmarkManager < Sinatra::Base
    get '/' do
      erb (:index)
    end

    get '/bookmarks' do
      @bookmark = Bookmarks.new
      erb (:bookmarks)
    end


    run! if app_file == $0
end
