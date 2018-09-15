class CommentsController < ApplicationController
  before_action :find_post
  before_action :find_comment, only: [:destroy]
  def create
    @comment = @post.comments.create(comment_params)
    @comment.rider = current_user.rider
    @comment.save
    authorize @comment
    redirect_to post_path(@post)

  end

  def destroy
    @comment.destroy
    redirect_to post_path(@post)
  end

  private

  def find_post
    @post=Post.find(params[:post_id])
  end

  def find_comment
    @comment = @post.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
