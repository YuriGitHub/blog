class PostsController < ApplicationController

  before_filter :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate, only: [:new, :create, :update, :edit, :destroy]

  def new
      @post = Post.new
    end

    def create
      post = Post.new(create_post)
       post.user_id = @current_user.id
      if post.save
        puts 'Error! post didnt create'
      elsif
      puts 'Post created'
      end
      redirect_to posts_path
  end

  def index
    @posts = Post.all
  end

  def edit

  end

  def show

  end

  def update
   @post.update(create_post)
    redirect_to post_path(@post)
  end

  def destroy
   @post.destroy
    redirect_to posts_path
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  private
  def create_post
    params.require(:post).permit(:title, :content)
  end




end
