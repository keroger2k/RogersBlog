class Admin::PostsController < Admin::AdminController
  respond_to :html
  before_filter :get_post, :except => [:index, :create]
  before_filter :authenticate_user!

  def index
    @posts = Post.all
    respond_with(@posts)
  end
  
  def show
    respond_with(@post)
  end
  
  def new
    @post.user_id = current_user.id
  end
  
  def edit
  
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to admin_posts_path, :notice => "Updated..." 
    else
      render :action => 'edit'
    end
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to admin_posts_path, :notice => "created..."
    else
      flash[:alert] = "bummer..."
      render :action => 'new'
    end
  end
  
  def destroy
    @post.destroy
    redirect_to admin_posts_url, :notice => "Deleted..."
  end

  private
    def get_post
      @post = params[:id].present? ? Post.find(params[:id]) : Post.new
    end
end
