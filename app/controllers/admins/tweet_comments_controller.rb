class Admins::TweetCommentsController < ApplicationController
  def destroy
    TweetComment.find(params[:tweet_id]).destroy
    redirect_to admins_tweet_path(params[:id])
  end

  private

  def tweet_comment_params
    params.require(:tweet_comment).permit(:comment)
  end
end
