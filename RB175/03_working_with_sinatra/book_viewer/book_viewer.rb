require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

get "/" do
  @title = "The Adventures of Sherlock Holmes"
  @toc = File.readlines("data/toc.txt")

  erb :home
end

get "/chapter/:number" do |num|
  @title = "Chapter #{num}"
  @toc = File.readlines("data/toc.txt")
  @chapter = File.read("data/chp#{num}.txt")

  erb :chapter
end
