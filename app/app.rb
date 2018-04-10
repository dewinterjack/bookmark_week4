require 'sinatra/base'
require_relative '../lib/manager'

class BookmarkManager < Sinatra::Base
  manager = Manager.new
  get '/' do
    Manager.wipe
    @bookmarks = Manager.all
    p @bookmarks
    erb(:index)
  end

  post '/add' do
    manager.add(params[:new_bookmark])
    redirect '/'
  end

  run! if app_file == $0
end