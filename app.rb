require 'sinatra/base'
require_relative 'lib/bookmark'
require 'pg'


class BookmarkManager < Sinatra::Base
    get '/' do
      erb (:index)
    end

enable :sessions

  post '/bookmark-saver' do
    session[:website] = params[:website]
    redirect '/bookmarks'
  end


    get '/bookmarks' do
      bookmark1 = Bookmark.new
      bookmark1.add_bookmark(session[:website])
      @bookmark = Bookmark.all
      erb (:bookmarks)
    end


    run! if app_file == $0
end
