require 'sinatra/base'
require_relative 'lib/bookmark'
require 'pg'


class BookmarkManager < Sinatra::Base
    get '/' do
      erb (:index)
    end

enable :sessions


    get '/bookmarks/new' do
      bookmark1 = Bookmark.new
      bookmark1.add_bookmark(session[:website])
      @bookmark = Bookmark.all
      erb (:bookmarks)
    end

    post '/bookmark-saver' do
      session[:website] = params[:website]
      p "Form data submitted to the /bookmark-saver route!"
      redirect '/bookmarks/new'
    end


    run! if app_file == $0
end
