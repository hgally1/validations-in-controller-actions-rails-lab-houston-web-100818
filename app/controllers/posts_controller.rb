class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def new

  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
  end

  def create
   @author = @post.create(post_params)
  end

  def update
    @post[:title] = params[:title]
    @post[:category] = params[:category]
    @post[:content] = params[:content]	   

    if @post.valid?
      @post.save
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  private

  def post_params
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
