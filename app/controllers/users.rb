# GETS ==================================
get '/create_user' do
	erb :"user/create_user"
end

get '/login' do
  erb :login
end


# POSTS =================================

post '/login' do 
	user = User.find_by_email(params[:email])
	if user && user.password == params[:password]
		session[:user_id] = user.id
		redirect '/'
	else
		redirect '/login'
	end
end

post '/create_user' do 
	User.create(params[:user])
	redirect '/'
end