post '/posts/:id/comments' do
  p = Post.find(params[:id])
  u = User.find(session[:user_id])
  @comment = Comment.new(params[:comment])
  @comment.post = p
  @comment.user = u
  @comment.save
  redirect "/posts/#{p.id}"
end
