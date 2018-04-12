require 'data_mapper'

require 'sinatra/base'
require 'sinatra/flash'
require 'uri'
require_relative '../lib/manager'
require_relative '../lib/bookmark'

class BookmarkManager < Sinatra::Base
  register Sinatra::Flash
  enable :sessions

  get '/' do
    # 304 status for not changing url on redirect
    redirect '/bookmarks'
  end

  get '/bookmarks' do
    if flash[:error] then
      p "Error: #{flash[:error]}"
    end
    @bookmarks = Manager.all
    erb(:index)
  end

  post '/add' do
    p params
    if params[:url] == "" then
      flash[:error] = "No url inputted."
    elsif params[:url] =~ URI::regexp
      Manager.add(params)
    else
      flash[:error] = "Invalid url."
    end
    redirect '/'
  end

  post '/bookmarks/delete' do
    p params
    if params[:id] == nil then
      flash[:error] = "No bookmarks selected!"
    else
      Manager.delete(params[:id])
    end
    redirect '/'
  end

  run! if app_file == $0
end
