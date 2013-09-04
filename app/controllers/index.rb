get '/' do
  # Look in app/views/index.erb
  @posts = Post.all
  erb :index
end

get '/home' do 
	if session[:user_id]
		@posts = Post.all
	  erb :home
	end
end

get '/logout' do 
	p session
	session.clear
	p session
end

