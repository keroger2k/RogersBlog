class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
    @post.user_id = current_user.id
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_path, :notice => "created"
    else
      flash[:alert] = "bummer"
      render :action => 'new'
    end
  end
end
