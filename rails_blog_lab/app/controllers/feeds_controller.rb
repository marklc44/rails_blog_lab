class FeedsController < ApplicationController
  def destroy
    tag_id = params[:tag].permit(:id)
    post_id = params[:post].permit(:id)

    feed = Feed.where(tag_id: tag_id, post_id: post_it).first
    feed.destroy

    redirect_to "/posts/edit/" + post_id
  end
end