# GETS ==================================

get '/login' do
  erb :login
end


# POSTS =================================

post '/login' do 
	user = User.find_by_email(params[:email])
	if user && user.password == params[:password]
		session[:user_id] = user.id
		redirect '/home'
	else
		redirect '/login'
	end
end