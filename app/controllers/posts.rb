# GETS ======================================

get '/create_post' do
  # Look in app/views/index.erb

  erb :create_post
end

get '/posts/:id' do
  @post= Post.find(params[:id])
  @comment = Comment.where(post_id: params[:id])
  p @comment
  erb :post
end

get '/posts/:id/edit' do
  @post= Post.find(params[:id])
  erb :edit_post
end

# POSTS ======================================

post '/create_post' do
  new_post = Post.new(params[:post])
  user = User.find(session[:user_id])
  new_post.author = user
  new_post.save
  redirect "/posts/#{new_post.id}"
end

post '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  redirect "/home"
end

post 'posts/:id/delete' do
  @post = Post.find(params[:id])
  @post.destroy
  redirect '/home'
end


