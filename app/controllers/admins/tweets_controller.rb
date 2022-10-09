class Admins::TweetsController < ApplicationController
  before_action :authenticate_admin!,only: [:index, :show, :destroy]
  def show
    @tweet = Tweet.find(params[:id])
    @customer = @tweet.customer
    @tweet_comment = TweetComment.new
    @tweet_comments = @tweet.tweet_comments
    @tweets = Tweet.where("created_at" === Date.today)
  end

  def index
    @tweets = Tweet.all
    if params[:search].present?
      @section_title = "「#{params[:search]}」の検索結果"
      @tweets = Tweet.where('body LIKE ? OR title LIKE ?', "%#{params[:search]}%", "%#{params[:search]}%").page(params[:page]).per(12).order(:updated_at)
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    if @tweet.destroy
    redirect_to admins_tweets_path,
    notice: 'successfully'
    else
    render :index
    end
  end

  private
  # ストロングパラメータ
  def tweet_params
    params.require(:tweet).permit(:title, :body)
  end
end
