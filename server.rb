require 'pry'
require 'sinatra'

$list = ['cd', 'mkdir', 'touch', 'mv', 'rm', 'cp', 'ls', 'pwd']
# root route
get '/' do
  erb :index
end

# List
get '/list' do
  $list
  erb :list
end

post '/list' do
  input = params[:add_input]
  $list << input
  erb :list
end

#print
get '/print' do
  @command_to_find = params[:print_button]
  erb :print
end


delete '/list/' do
  delete_me = params[:id]
  binding.pry
  $list.delete(delete_me)
  erb :list
end

# find
get '/find' do
  erb :find
end

post '/find' do
  @command_to_find = params[:user_input]
  erb :find
end

# add
get '/add' do
  erb :add
end

# export
get '/export' do
  erb :export
end

# erase
get '/erase' do
  erb :erase
end
