class CommentsController < ApplicationController

  def index
    find_post_by_id
    @comments = @post.comments
  end

  def show
    find_post_by_id
    find_comment_by_id
  end

  def new
    find_post_by_id
    @comment = @post.comments.new
  end

  def create
    find_post_by_id
    comment = params.require(:comment).permit(:author, :body, :title)
    @comment = @post.comments.create(comment)

    redirect_to [@post, @comment]
  end

  def edit
    find_post_by_id
    find_comment_by_id
  end

  def update
    find_post_by_id
    comment_id = params[:id]
    comment = params.require(:comment).permit(:author, :body, :title)
    @comment = @post.comments.find_by_id(comment_id).update_attributes(comment)

    # this is all fucked up
    redirect_to [@post]
  end

  def destroy
    find_post_by_id
    find_comment_by_id
    @comment.destroy

    redirect_to @post
  end

  private

  def find_post_by_id
    post_id = params[:post_id]
    @post = Post.find_by_id(post_id)
  end
  def find_comment_by_id
    comment_id = params[:id]
    @comment = @post.comments.find_by_id(comment_id)
  end
end
