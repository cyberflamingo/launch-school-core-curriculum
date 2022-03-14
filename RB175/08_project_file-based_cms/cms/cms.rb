require "redcarpet"
require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, "VERY_BAD_SECRET"
  set :erb, escape_html: true
end

# rubocop:disable Style/ExpandPathArguments
root = File.expand_path("..", __FILE__)
# rubocop:enable Style/ExpandPathArguments

def render_markdown(text)
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
  markdown.render(text)
end

def load_file_content(path)
  content = File.read(path)
  case File.extname(path)
  when ".txt"
    headers["Content-Type"] = "text/plain"
    content
  when ".md"
    render_markdown(content)
  end
end

get "/" do
  @files = Dir.glob(root + "/data/*").map do |path|
    File.basename(path)
  end

  erb :index
end

get "/:filename" do
  file_path = root + "/data/" + params[:filename]

  if File.file?(file_path)
    load_file_content(file_path)
  else
    session[:message] = "#{params[:filename]} does not exist."
    redirect "/"
  end
end
