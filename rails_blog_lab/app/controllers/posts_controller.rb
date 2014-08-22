class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @tags = Tag.all
  end

  def create

    post = params[:post].permit(:title, :description, :author)
    tag = params[:tag].permit(:new)
    tags = tag[:new].split(',')

    new_post = Post.create(title: post[:title], description: post[:description], author: post[:author])

    tags.each do |tag|
      if(tags.length > 0)
        new_tag = Tag.find_or_create_by(name: tag)
        new_post.tags << new_tag
      end
    end
    redirect_to "/"
  end

  def show
    id = params[:id]
    @post = Post.find_by_id(id)
    @comments = @post.comments
  end

  def edit
    find_post_by_id
  end

  def update
    post = params[:post].permit(:title, :description, :author, :id)
    tag = params[:tag].permit(:new)
    tags = tag[:new].split(',')

    to_update = Post.find_by_id(post[:id])
    to_update.update_attributes(title: post[:title], description: post[:description], author: post[:author])

    to_update.tags.clear

    tags.each do |tag_str|
      new_tag = Tag.find_or_create_by(name: tag_str)
      to_update.tags << new_tag
    end
    redirect_to to_update
  end

  def destroy
    post = params[:post].permit(:id)
    to_destroy = Post.find_by_id(post[:id])
    to_destroy.destroy

    redirect_to to_destroy
  end

  private

  def find_post_by_id
    id = params[:id]
    @post = Post.find_by_id(id)
  end
end
