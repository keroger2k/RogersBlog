class PostsController < ApplicationController
  respond_to :html

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

end
