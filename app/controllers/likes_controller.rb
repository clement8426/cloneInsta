class LikesController < ApplicationController
  before_action :set_post

  def toggle_like
    @like = @post.likes.find_by(user: current_user)

    if @like
      @like.destroy
    else
      @post.likes.create(user: current_user)
    end

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace(@post, partial: "posts/post", locals: { post: @post }) }
      format.html { redirect_to @post }
    end
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
