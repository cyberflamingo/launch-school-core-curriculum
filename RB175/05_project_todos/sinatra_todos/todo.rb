require "sinatra"
require "sinatra/reloader"
require "tilt/erubis"

configure do
  enable :sessions
  set :session_secret, 'ABSOLUTELY_NOT_A_GOOD_WAY_TO_SAVE_SECRET'
end

before do
  session[:lists] ||= []
end

get "/" do
  redirect "/lists"
end

# View list of lists
get "/lists" do
  @lists = session[:lists]

  erb :lists, layout: :layout
end

# Render the new list form
get "/lists/new" do
  erb :new_list, layout: :layout
end

# Create a new list
post '/lists' do
  session[:lists] << { name: params[:list_name], todos: [] }
  session[:success] = "The list has been created."

  redirect "/lists"
end
