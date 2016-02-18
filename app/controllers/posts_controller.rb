class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  
  def index
    @posts = Post.created_descending
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Sweet you got it bro!"
    else
      render :new, notice: "Failed"
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Success!"
    else
      render :edit, notice: "Failed"
    end
  end
  
  def destroy
    @post.destroy
    redirect_to posts_path
  end
  
  private
    def post_params
      #Permit slug for friendly id
      params.require(:post).permit(:title, :content, :slug)
    end
    
    def find_post
      #Post.friendly.find makes use of the friendly_id gem
      @post = Post.friendly.find(params[:id])
    end
end
