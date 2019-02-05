require 'sinatra/base'
require_relative 'lib/bookmark'
require 'pg'
require './spec/database_connection_setup.rb'


class BookmarkManager < Sinatra::Base
    get '/' do
      erb (:index)
    end

enable :sessions, :method_override


    get '/bookmarks/new' do
      @bookmark = Bookmark.all
      erb (:bookmarks)
    end

    post '/bookmark-saver' do
      Bookmark.create(params[:website], params[:bookmark_name])
      p "Form data submitted to the /bookmark-saver route!"
      redirect '/bookmarks/new'
    end


    delete '/bookmark-deleter/:id' do
      Bookmark.delete(params[:id])
      redirect '/bookmarks/new'
    end

    get '/bookmark-editor/:id/edit' do
        @bookmark_id = params[:id]
        erb (:edit_bookmark)
    end

    patch '/bookmarks/:id' do
        Bookmark.update(params[:url], params[:title], params[:id])
        redirect '/bookmarks/new'
    end


    run! if app_file == $0
end
