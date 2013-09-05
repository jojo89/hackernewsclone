get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

get '/logout' do
	session.clear
	redirect "/"
end

