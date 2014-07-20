require "sinatra"
require "tumblr_client"

set :public_folder, File.dirname(__FILE__)

# Stored in a file outside of this repo
cfg = File.new("oauth_config").readlines.collect{ |l| l.chomp }
Tumblr.configure do |config|
  config.consumer_key = cfg[0]
  config.consumer_secret = cfg[1]
  config.oauth_token = cfg[2]
  config.oauth_token_secret = cfg[3]
end

get "/" do
  html = File.new("index.html").read
  post_html = File.new("post.html").read

  tumblr = Tumblr::Client.new
  posts = tumblr.posts("fu-er.tumblr.com", :limit => 10)["posts"]
  posts.each { |p|
    p_html = post_html.gsub("TITLE", p["title"]).gsub("DATE", p["date"]).gsub("CONTENT", p["body"]).gsub("LINK", p["post_url"])
    html.gsub!("CONTENT", p_html + "CONTENT")
  }
  html.gsub!("CONTENT", "")

  html
end

get "/gallery" do
  cat = params[:cat]
  if cat == nil
    cat = "clay"
  end

  html = File.new("gallery/index.html").read
  dir = "content/gallery/" + cat + "/";
  first = ""
  Dir.foreach(dir) do |file|
    next if file == "." or file == ".."

    if first.length == 0
      first = file
    end

    tmp_dir = dir + file
    desc_file = tmp_dir + "/description.txt"
    preview_file = tmp_dir + "/preview.png"
    thumb_file = tmp_dir + "/thumb.png"
    next if not File.exists?(preview_file) or not File.exist?(thumb_file)

    if File.exists?(desc_file)
      html.gsub!("DESCRIPTION",
      "<p id=\"#{file}_desc\" class=\"gallery_description\">" + File.new(desc_file).read + "</p>DESCRIPTION")
    else
      html.gsub!("DESCRIPTION",
      "<p id=\"#{file}_desc\" class=\"gallery_description\"></p>DESCRIPTION")
    end
    html.gsub!("PREVIEW",
    "<a href=\"../#{preview_file}\" target=\"_blank\"><img id=\"#{file}_preview\" class=\"gallery_preview\" src=\"../#{preview_file}\" /></a>PREVIEW")
    html.gsub!("THUMBS",
    "<a href=\"javascript:gallery_toggle('#{file}')\"><img id=\"#{file}_thumb\" class=\"gallery_thumbnail\" src=\"../#{thumb_file}\" /></a>" + "THUMBS")


    Dir.glob(tmp_dir + "/*.png") do |step|
      id = File.basename(step, ".png")
      next if id == "thumb" or id == "preview"
      html.gsub!("STEPS",
      "<a href=\"../#{step}\" target=\"_blank\"><img id=\"#{file}_step_#{id}\" class=\"gallery_step\" src=\"../#{step}\" /></a>" + "STEPS")
    end
  end

  html.gsub!("ON_LOAD", "gallery_toggle('#{first}');")

  # Cleanup
  html.gsub!("THUMBS", "")
  html.gsub!("STEPS", "")
  html.gsub!("DESCRIPTION", "")
  html.gsub!("PREVIEW", "")

  html
end

get "/about" do
  File.new("about/index.html").readlines
end

get "/resume" do
  File.new("resume/index.html").readlines
end
