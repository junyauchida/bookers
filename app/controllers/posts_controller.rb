class PostsController < ApplicationController

  def top
  end

  def new
  	@post = Post.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  	  redirect_to post_path(@post.id), notice: 'successfully'
  	else
  	  @posts = Post.all
  	  render :index
  	end
  end

  def index
  	@posts = Post.all
  	@post = Post.new
  end

  def show
  	@post = Post.find(params[:id])
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.update(post_params)
  	   redirect_to post_path(@post.id), notice: 'successfully'
    else
  	   @posts = Post.all
  	   render :edit
  	end
  end

  def destroy
  	post = Post.find(params[:id])
  	post.destroy
  	redirect_to posts_path
  end

  private
  def post_params
     params.require(:post).permit(:title, :body)
  end

end
