class PostsController < ApplicationController
  before_action :set_rider, only: [:new, :create, :vote]
   before_action :set_post, only: [ :like]
   # respond_to :js, :json, :html
  def index
    @posts = policy_scope(Post)

  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def new
    @rider = Rider.find(params[:rider_id])
    @post = Post.new
    authorize @post

  end

  def create
    @post= Post.new(post_params)
    authorize @post
    @post.rider = current_user.rider
    @post.save
    redirect_to root_path
  end

  def like
    value = params[:type] == "up" ? 1 : -1
     @post = Post.find(params[:id])
     authorize @post
     @post.add_or_update_evaluation(:likes, value, current_user)
     redirect_to :back
  end

  # def vote
  #   if !current_user.liked? @post
  #     @post.liked_by current_user.rider
  #   elsif current_user.liked? @post
  #     @post.unlike_by current_user
  #   end
  # end

  private

  def post_params
    params.require(:post).permit(:fotografo, :foto)
  end

  def set_rider
    @rider = Rider.find(params[:rider_id])
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
