class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]


  def index
    if current_user
      @posts = policy_scope(Post)
    else
      @posts = Post.where(published: true).order('created_at DESC')
    end
  end

  def show
    @post = Post.find(params[:id])
    if request.path != post_path(@post)
      redirect_to @post, status: :moved_permanently
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(params[:post])
    if @post.save
      redirect_to posts_path
    end
  end


  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end
end
