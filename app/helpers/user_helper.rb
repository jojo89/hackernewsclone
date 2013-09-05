
def current_user
	return session[:user_id] if session[:user_id]
	false 
end