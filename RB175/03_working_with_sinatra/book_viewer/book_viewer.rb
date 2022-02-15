require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

before do
  @contents = File.readlines("data/toc.txt")
end

get "/" do
  @title = "The Adventures of Sherlock Holmes"

  erb :home
end

get "/chapters/:number" do
  number = params[:number].to_i
  chapter_name = @contents[number - 1]

  redirect "/" unless (1..@contents.size).cover? number

  @title = "Chapter #{number}: #{chapter_name}"
  @chapter = File.read("data/chp#{number}.txt")

  erb :chapter
end

get "/search" do
  @results = chapters_matching(params[:query])

  erb :search
end

get "/show/:name" do
  params[:name]
end

not_found do
  redirect "/"
end

helpers do
  def in_paragraphs(text)
    text.split("\n\n").map.with_index do |paragraph, index|
      "<p id='paragraph#{index}'>#{paragraph}</p>"
    end.join
  end

  def highlight(paragraph, query)
    paragraph.gsub(query, "<strong>#{query}</strong>")
  end
end

# Calls the block for each chapter, passing that chapter's number, name, and
# contents.
def each_chapter
  @contents.each_with_index do |name, index|
    number = index + 1
    contents = File.read("data/chp#{number}.txt")
    yield number, name, contents
  end
end

# This method returns an Array of Hashes representing chapters that match the
# specified query. Each Hash contain values for its :name and :number keys.
def chapters_matching(query)
  ret = []

  return ret if !query || query.empty?

  each_chapter do |number, name, contents|
    matches = {}

    contents.split("\n\n").each_with_index do |paragraph, position|
      matches[position] = paragraph if paragraph.include?(query)
    end

    ret << { number: number, name: name, paragraphs: matches } if matches.any?
  end

  ret
end
