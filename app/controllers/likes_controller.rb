class LikesController < ApplicationController
    def create
      @user = current_user
      @post = Post.find(params[:post_id])
      @like = Like.new(user_id: current_user, post_id: params[:post_id])
      
      unless @like.save
        @post.increment!(:likes_counter)
        redirect_to user_post_path(@user, @post)
      end
    end
  end
  