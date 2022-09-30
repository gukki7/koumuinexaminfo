class Customers::BookmarksController < ApplicationController
  before_action :authenticate_customer!

  def create
    @tweet = Tweet.find(params[:post_id])
    bookmark = @tweet.bookmarks.new(customer_id: current_customer.id)
    if bookmark.save
      redirect_to request.referer
    else
      redirect_to request.referer
    end
  end

  def destroy
    @tweet = Tweet.find(params[:post_id])
    bookmark = @tweet.bookmarks.new(customer_id: current_customer.id)
    if bookmark.present?
        bookmark.destroy
        redirect_to request.referer
    else
        redirect_to request.referer
    end
  end
end
