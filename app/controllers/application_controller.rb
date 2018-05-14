
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end

  post '/posts' do
    Post.create(attribute:params[:attribute])
    @posts = Post.all
    erb :index
  end

  post '/posts/:id' do
    @post = Post.find(params[:id])
  end

end
