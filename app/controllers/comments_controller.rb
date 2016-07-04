class CommentsController < ApplicationController

  before_filter :authenticate, only: [:new, :create, :update, :edit, :destroy]

  def index
    @comments = Comment.where(users: session[:user_id])
  end

  def create
    post = Post.find(params[:post_id])
    comment = Comment.new(get_params)
    comment.post = post
    comment.user = @current_user
    comment.save
    redirect_to post_path(post)
  end

  def delete_current_comment
    c = Comment.find(params[:comment_id])
    id = c.post
    c.destroy
    redirect_to post_path(id)
  end
def update_current
  comment = Comment.find(params[:comment_id])
  comment.update(get_params)

  redirect_to post_path(comment.post)
end

  def show_current
    @comment = Comment.find(params[:comment_id])
  end

  def new


  end

  def edit

  end

  def show

  end

  def update

  end

  def destroy

  end

  private
  def get_params
    params.require(:comment).permit(:content)
  end
end
