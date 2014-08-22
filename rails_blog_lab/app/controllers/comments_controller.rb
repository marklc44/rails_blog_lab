class CommentsController < ApplicationController

  def index
    post_id = params[:post_id]
    @post = Post.find_by_id(post_id)
    @comments = @post.comments
  end

  def show
    post_id = params[:post_id]
    comment_id = params[:id]
    @post = Post.find_by_id(post_id)
    @comment = @post.comments.find_by_id(comment_id)
  end

  def new
    post_id = params[:post_id]
    @post = Post.find_by_id(post_id)
    @comment = @post.comments.new
  end

  def create
    post_id = params[:post_id]
    comment = params.require(:comment).permit(:author, :body, :title)
    @post = Post.find_by_id(post_id)
    @comment = @post.comments.create(comment)

    redirect_to [@post, @comment]
  end

  def update

  end

  def destroy
    post_id = params[:post_id]
    comment_id = params[:id]
    @post = Post.find_by_id(post_id)
    @comment = @post.comments.find_by_id(comment_id)
    @comment.destroy

    redirect_to @post
  end
end
