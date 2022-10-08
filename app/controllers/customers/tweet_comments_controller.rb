class Customers::TweetCommentsController < ApplicationController
  def create
    @tweet = Tweet.find(params[:tweet_id])
    comment = current_customer.tweet_comments.new(tweet_comment_params)
    comment.tweet_id = params[:tweet_id]
    comment.save
    redirect_to customers_tweet_path(@tweet)
  end

  def destroy
    TweetComment.find(params[:tweet_id]).destroy
    redirect_to customers_tweet_path(params[:id])
  end

  private

  def tweet_comment_params
    params.require(:tweet_comment).permit(:comment)
  end
end
