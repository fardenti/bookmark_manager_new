require 'sinatra/base'
require_relative './lib/bookmark'

class BookmarkManager < Sinatra::Base

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks/new' do
    new_url = params[:url]
    new_title = params[:title]
    Bookmark.create(new_url, new_title)
    redirect '/bookmarks'
  end

  run! if app_file == $0
end
