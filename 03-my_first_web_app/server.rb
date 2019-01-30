require 'sinatra'

get '/' do
  redirect to '/home'
end

get '/home' do
  erb :index
end

get '/gallery' do
  redirect to '/portfolio'
end

get '/portfolio' do
  erb :gallery
end

get '/about-me' do

  @skills       =   %w(git HTML CSS Ruby)
  @interests    =   %w(films coffee soccer ruby js php)

  erb :about_me
end

get '/favourites' do
  @fav_links    =   %w(marca.com imdb.com google.ca)

  erb :my_links
end
