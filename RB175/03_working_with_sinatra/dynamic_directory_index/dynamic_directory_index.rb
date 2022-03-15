require "sinatra"
require "sinatra/reloader"

get "/" do
  @static_files = Dir.glob(:public.to_s + "/*").map { |file|
    File.basename(file)
  }.sort

  @sort_url = "/?sort=des"
  @sort_link = "Sort descending"

  if params['sort'] == 'des'
    @static_files.reverse!

    @sort_url = "/?sort=asc"
    @sort_link = "Sort ascending"
  end

  erb :index
end
