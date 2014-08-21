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
  end

  def edit
    id = params[:id]
    @post = Post.find_by_id(id)
  end

  def update
    post = params[:post].permit(:title, :description, :author, :id)
    tag = params[:tag].permit(:new)
    tags = tag[:new].split(',')

    to_update = Post.find_by_id(post[:id])
    to_update.update_attributes(title: post[:title], description: post[:description], author: post[:author])

    tags.each do |tag_str|
      if(tags.length > 0)
        new_tag = Tag.find_or_create_by(name: tag_str)
        to_update.tags.each do |tag_found|
        to_update.tags << new_tag
      end
    end
    redirect_to "/posts/" + params[:id]
  end

  def destroy
    post = params[:post].permit(:id)
    to_destroy = Post.find_by_id(post[:id])
    to_destroy.destroy

    redirect_to "/"
  end

  end
end
