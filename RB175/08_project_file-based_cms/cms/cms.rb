require "sinatra"
require "sinatra/reloader" if development?
require "tilt/erubis"

# rubocop:disable Style/ExpandPathArguments
root = File.expand_path("..", __FILE__)
# rubocop:enable Style/ExpandPathArguments

configure do
  set :erb, escape_html: true
end

get "/" do
  @files = Dir.glob(root + "/data/*").map do |path|
    File.basename(path)
  end

  erb :index
end

get "/:filename" do
  file_path = root + "/data/" + params[:filename]

  headers["Content-Type"] = "text/plain"

  File.read(file_path)
end
