class PostsController < ApplicationController
  before_action :load_and_authorize_resource, only: [:destroy]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @post = Post.new(post_parameters)
    @post.user = current_user
    @post.user_id = current_user.id
    @post.comments_counter = 0
    @post.likes_counter = 0
    if @post.save
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    current_user = User.find(params[:user_id])
    @post = Post.find_by!(id: params[:id])
    @post.destroy
    current_user.decrement!(:PostsCounter)
    redirect_to user_posts_path(current_user)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(params[:user_id])
  end

  private

  def post_parameters
    params.require(:new_post).permit(:Title, :Text)
  end
end
