# encoding: utf-8

require 'rubygems'
require 'sinatra'
require 'tumblr_client'

#FileUtils.mkdir('log') unless File.directory?('log')
#$stdout.reopen(File.new("log/app.log", "a"))
#$stderr.reopen($stdout)

# Build global css file
all_css = 'css/all.css'
File.delete(all_css) if File.exist?(all_css)
out_css = File.new(all_css, 'w')
Dir.glob('css/*.css') do |css|
  out_css << File.new(css, 'rb').read
end
out_css.close

get "/" do
  redirect "/blog"
end

get "/blog" do
  html = File.new("blog/index.html", "rb").read
  post_html = File.new("blog/post.html", "rb").read

  # Stored in a file outside of this repo
  cfg = File.new("oauth_config", "rb").readlines.collect{ |l| l.chomp }
  Tumblr.configure do |config|
    config.consumer_key = cfg[0]
    config.consumer_secret = cfg[1]
    config.oauth_token = cfg[2]
    config.oauth_token_secret = cfg[3]
  end

  tumblr = Tumblr::Client.new
  posts = tumblr.posts("fu-er.tumblr.com", :limit => 10)["posts"]
  posts.each { |p|
    puts p
    type = p["type"]
    p_html = post_html.gsub("DATE", p["date"]).gsub("LINK", p["post_url"])
    if type == "text"
      p_html = p_html.gsub("TITLE", p["title"]).gsub("CONTENT", p["body"])
    elsif type == "photo"
      p_html = p_html.gsub("TITLE", "Blah")
      
      p["photos"].each { |ph|
        p_html = p_html.gsub("CONTENT", "<img style='width: 75%;' src='" + ph["original_size"]["url"] + "'></img>" + p["caption"] + "CONTENT")
      }
      p_html = p_html.gsub("CONTENT", "")
    else
      puts "unsupported post type: " + type
    end
    html.gsub!("CONTENT", p_html + "CONTENT")
  }
  html.gsub!("CONTENT", "")

  html
end

get "/gallery" do
  cat = params[:cat]
  if cat == nil
    cat = "vector"
  end

  html = File.new("gallery/index.html", "rb").read
  dir = "gallery/" + cat + "/";
  first = ""
  files = Dir.entries(dir).sort.reverse
  files.each do |file|
    next if file == "." or file == ".." or file.start_with?("skip_")

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
      "<div id=\"#{file}_desc\" class=\"gallery_description\">" + File.new(desc_file, "rb").read + "</div>DESCRIPTION")
    else
      html.gsub!("DESCRIPTION",
      "<div id=\"#{file}_desc\" class=\"gallery_description\"></div>DESCRIPTION")
    end
    html.gsub!("PREVIEW",
    "<a href=\"../#{preview_file}\" target=\"_blank\"><img id=\"#{file}_preview\" class=\"gallery_preview\" src=\"../#{preview_file}\" alt=\"preview\" /></a>PREVIEW")
    html.gsub!("THUMBS",
    "<a href=\"javascript:gallery_toggle('#{file}')\"><img id=\"#{file}_thumb\" class=\"gallery_thumbnail\" src=\"../#{thumb_file}\" alt=\"thumb\" /></a>" + "THUMBS")


    steps = Dir.glob(tmp_dir + "/*.png").sort
    steps.each do |step|
      id = File.basename(step, ".png")
      next if id == "thumb" or id == "preview"
      html.gsub!("STEPS",
      "<a href=\"../#{step}\" target=\"_blank\"><img id=\"#{file}_step_#{id}\" class=\"gallery_step\" src=\"../#{step}\" alt=\"step\" /></a>" + "STEPS")
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
  File.new("about/index.html", "rb").readlines
end

get "/resume" do
  File.new("resume/index.html", "rb").readlines
end
