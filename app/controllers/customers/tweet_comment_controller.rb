class Customers::TweetCommentController < ApplicationController
  def create
    comment = current_customer.tweet_comments.new(tweet_comment_params)
    comment.save
    redirect_to customers_tweet_path(tweet)
  end

  def destroy
    TweetComment.find(params[:id]).destroy
    redirect_to customers_tweet_path(params[:tweet_id])
  end

  private

  def tweet_comment_params
    params.require(:tweet_comment).permit(:comment)
  end
end
