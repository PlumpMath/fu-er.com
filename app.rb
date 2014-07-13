require 'sinatra'

set :public_folder, File.dirname(__FILE__)

get '/' do
  File.new("index.html").readlines
end

get '/resume' do
  File.new("resume/index.html").readlines
end
