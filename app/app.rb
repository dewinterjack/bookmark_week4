require 'sinatra/base'
require 'sinatra/flash'
require_relative '../lib/manager'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    if flash[:no_url] then
      "Error: #{flash[:no_url]}"
    end
    Manager.wipe
    @bookmarks = Manager.all
    p @bookmarks
    erb(:index)
  end

  post '/add' do
    if params[:new_bookmark] == "" then
      flash[:no_url] = "No url inputted."
    else
      Manager.add(params[:new_bookmark])
    end
    redirect '/'
  end

  run! if app_file == $0
end