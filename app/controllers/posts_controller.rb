class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]  #if not signed in it will not allow us to create posts
  
  def index
    @posts = Post.created_descending.paginate(page: params[:page], per_page: 2)
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: "Sweet you got it bro!"
    else
      render :new
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
      render :edit
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
