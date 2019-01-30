require 'sinatra/base'
require_relative 'lib/bookmark'
require 'pg'


class BookmarkManager < Sinatra::Base
    get '/' do
      erb (:index)
    end

enable :sessions


    get '/bookmarks/new' do
      @bookmark = Bookmark.all
      p @bookmark
      erb (:bookmarks)
    end

    post '/bookmark-saver' do
      Bookmark.create(params[:website], params[:bookmark_name])
      p "Form data submitted to the /bookmark-saver route!"
      redirect '/bookmarks/new'
    end


    run! if app_file == $0
end
