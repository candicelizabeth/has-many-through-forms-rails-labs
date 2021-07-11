class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.categories.build
    @post.comments.build
  end

  def create
    post = Post.new(post_params)
    if post.save 
      redirect_to post
    else 
      render :new
    end
    
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
