require 'pry'
require 'sinatra'

$list = ['cd', 'mkdir', 'touch', 'mv', 'rm', 'cp', 'ls', 'pwd']
# root route
get '/' do
  erb :index
end

# get '/list' do
#   erb :list
# end

get '/list' do
  $list
  erb :list
end

post '/list' do
  input = params[:add_input]
  $list << input
  erb :list
end

delete '/list/' do
  delete_me = params[:id]
  binding.pry
  $list.delete(delete_me)
  erb :list
end

get '/find' do
  erb :find
end

post '/find/:user_input' do
  @command_to_find = params[:user_input]
  erb :find
end

get '/add' do
  erb :add
end

get '/export' do
  erb :export
end

get '/erase' do
  erb :erase
end
