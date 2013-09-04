get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

get '/home' do
	if session[:user_id]
		@posts = Post.all
	  erb :home
  else
    redirect "/"
	end
end

get '/logout' do
	session.clear
	redirect "/"
end

