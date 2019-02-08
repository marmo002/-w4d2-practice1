require './contact'
require 'sinatra'

get '/' do
  erb :index
end

get '/contacts' do

  @contact = Contact.all

  erb :contact
end

get '/about' do
  erb :about
end

after do
  ActiveRecord::Base.connection.close
end
