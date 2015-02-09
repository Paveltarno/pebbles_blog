class PostsController < ApplicationController

  def index
  end

  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
  end

  def edit
  end

  def update
  end

  private

    def post_params
      params.require(:post).permit(:title, :content)
    end

end
