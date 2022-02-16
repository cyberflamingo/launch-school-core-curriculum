require "yaml"
require "tilt/erubis"
require "sinatra"
require "sinatra/reloader"

before do
  @users_data = YAML.load_file("data/users.yaml")
  @users_names = @users_data.keys
end

get "/" do
  redirect "/users"
end

get "/users" do
  erb :users
end

get "/users/:name" do
  @user_name = params[:name]

  redirect "/" unless @users_names.map(&:to_s).include?(@user_name)

  @user_data = @users_data[@user_name.to_sym]

  @email = @user_data[:email]
  @interests = @user_data[:interests]

  erb :user
end

not_found do
  'This is nowhere to be found.'
end

helpers do
  def count_interests
    interests = []
    @users_data.each do |_, v|
      interests << v[:interests]
    end

    interests.flatten.uniq.length
  end
end
