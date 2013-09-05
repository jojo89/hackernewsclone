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

get '/posts/:id/delete' do
  @post = Post.find(params[:id])
  if @post.author.id == current_user
    @post.destroy
    redirect '/'
  else
    redirect '/'
  end
end

# POSTS ======================================

post '/create_post' do
  new_post = Post.new(params[:post])
  user = User.find(current_user)
  new_post.author = user
  new_post.save
  redirect "/posts/#{new_post.id}"
end

post '/posts/:id' do
  @post = Post.find(params[:id])
  @post.update_attributes(params[:post])
  redirect "/"
end


