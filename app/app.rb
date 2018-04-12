require 'data_mapper'
require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative '../lib/manager'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  configure :development do
    DataMapper.setup(:default, 'postgres://localhost/bookmark_manager')
  end

  configure :test do
    DataMapper.setup(:default, 'postgres://localhost/bookmark_manager_test')
  end

  get '/' do
    if flash[:error] then
      p "Error: #{flash[:error]}"
    end
    Manager.wipe
    @bookmarks = Manager.all
    erb(:index)
  end

  post '/add' do
    if params[:new_bookmark] == "" then
      flash[:error] = "No url inputted."
    elsif params[:new_bookmark] =~ URI::regexp
      Manager.add(params[:new_bookmark], params[:bookmark_title])
    else
      flash[:error] = "Invalid url."
    end
    redirect '/'
  end

  post '/delete' do
    p params[:delete]
    if params[:delete] == nil then
      flash[:error] = "No bookmarks selected!"
    else
      Manager.delete(params[:delete])
    end
    redirect '/'
  end

  run! if app_file == $0
end
