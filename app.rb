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
  html = File.new("index.html").read
  post_html = File.new("post.html").read

  tumblr = Tumblr::Client.new
  posts = tumblr.posts('fu-er.tumblr.com', :limit => 10)['posts']
  posts.each { |p|
    p_html = post_html.gsub('TITLE', p['title']).gsub('DATE', p['date']).gsub('CONTENT', p['body']).gsub('LINK', p['post_url'])
    html.gsub!('CONTENT', p_html + 'CONTENT')
  }
  html.gsub!('CONTENT', '')

  html
end

get '/gallery' do
  File.new("gallery/index.html").readlines
end

get '/about' do
  File.new("about/index.html").readlines
end

get '/resume' do
  File.new("resume/index.html").readlines
end
