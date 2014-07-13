require 'sinatra'
require 'tumblr_client'

set :public_folder, File.dirname(__FILE__)

# Stored in a file outside of this repo
cfg = File.new('oauth_config').readlines.collect{ |l| l.chomp }
Tumblr.configure do |config|
  config.consumer_key = cfg[0]
  config.consumer_secret = cfg[1]
  config.oauth_token = cfg[2]
  config.oauth_token_secret = cfg[3]
end

get '/' do
  #File.new("index.html").readlines
  
  data = ""
  
  tumblr = Tumblr::Client.new
  posts = tumblr.posts('fu-er.tumblr.com')['posts']
  posts.each { |p|
    data += '<hr/>' + p['body']
  }
  data
end

get '/resume' do
  File.new("resume/index.html").readlines
end
