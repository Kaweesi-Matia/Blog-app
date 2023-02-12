class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def index
    @comments = Comment.where(post_id: params[:post_id])
    render json: @comments
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.create(user_id: params[:user_id], post_id: params[:post_id], text: comments_params)
    @user = User.find(params[:user_id])
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:notice] = 'Comment successfully created!'
      redirect_to user_post_path(@user.id, @post)
    else
      flash.now[:error] = 'Error: Comment creation not successful'
      render :new
    end
  end

  def destroy
    current_user = User.find(params[:user_id])
    @post = Post.find_by!(id: params[:post_id])
    @comment = Comment.find_by!(post_id: params[:post_id], id: params[:id])
    @comment.destroy
    @post.decrement!(:comments_counter)
    redirect_to user_post_path(current_user, @post)
  end

  def comments_params
    params.require(:comment).permit(:text)
  end
end
